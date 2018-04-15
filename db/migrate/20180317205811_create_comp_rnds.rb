class CreateCompRnds < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_rnds do |t|

	    t.integer :seller_id # provider
      t.integer :buyer_id
      t.integer :prod_id
      t.belongs_to :quarter, foreign_key: true
      t.integer :quarterO_id # obtained
      # provider-> if null => system
      # quarter -> null (contract brake)
      # quarterO_id <= current Quarter => company possess the RnD
      t.integer :quarterM, unsigned: true, limit: 1, default: 255 #max obtained
      t.integer :price, unsigned: true #price paid by buyer_id (per quarter otan agora apo systhma, alliws efapaks metaksu epixeirhsewn)
      t.integer :advancePayment, unsigned: true, default: 0 #instant payment without guarantees after both have signed
      # if company fails to deliver RnD then advancePayment is lost, but penalty is paid.
      t.integer :penalty, unsigned: true
      t.integer :delayPenalty, unsigned: true
      #sthn agora apo to systhma. kostos ergatwn pou kathisteroun ena trimhno tis ergasies, enw exoun idi proslifthei.
      #kai ws kostos epipleon ena pososto ths ekptwshs poy eixe lifthei ana eksamino an eixan epilegei polla steps.
      t.boolean :resaleRightsS, default: true #seller_id
      t.boolean :resaleRightsB, default: true #buyer_id
      t.boolean :signedS, default: false #auto insert 0, if there is edit and a value is 1, then it is reset to 0 again and resign procedure.
      t.boolean :signedB, default: false
      t.boolean :cancelled, default: false #auto insert 0 and if anyone rejects the contract then rejected becomes 1.
      t.timestamps
    end
    add_foreign_key :comp_rnds, :companies, column: :seller_id
    add_foreign_key :comp_rnds, :companies, column: :buyer_id, null: false
    add_foreign_key :comp_rnds, :prod_chars, column: :prod_id, null: false
    add_foreign_key :comp_rnds, :quarters, column: :quarterO_id

    add_index :comp_rnds, [:seller_id, :prod_id, :quarterO_id, :cancelled], name: 'index_comp_rnds_on_buyer_id_as_seller_id'
    add_index :comp_rnds, [:buyer_id, :prod_id, :cancelled], name: 'index_comp_rnds_on_prod_avail'
    add_index :comp_rnds, [:seller_id, :buyer_id, :prod_id, :cancelled], name: 'index_comp_rnds_on_same_open_contract'
    add_index :comp_rnds, [:buyer_id, :prod_id, :cancelled, :signedS, :signedB], name: 'index_comp_rnds_on_uniqueness'


# RnD Trigger description
# Restrictions:

# INSERT/CREATE:

# do not sell to your own company
# Check that the signed Quarter is the current
# Check that the selling product is in RnD category
# Check if someone tries to sell an RnD earlier than when it will be ready and prevent it (earliest quarterO_id)
# Check that this specific RnD is available at the current quarter (prod_char -> avail)
# Check that the company has the rights to sell the specific RnD
# Check that only 1 contract is in prosses for a specific RnD between 2 specific companies. (no duplicates)

# Check that the company possess the RnD or it has signed to have it earlier than the selling quarter (quarterO)
# (So check if RnD will be ready the time the company wants to sell it)


# UPDATE:

# When in negotiations between 2 specific companies for 1 specific RnD => restrict changes in companies or in RnD
# if needed then begin negotiations for other contract and cancel current.

# Restrict changing already cancelled contract -> lock it
# Lock it also when it is signed by both sides and do not allow changes by users

# Take into consideration each quarter's companies financial score and if RnD cannot be completed due to
# insufficient amount of money of the company, ask the user to postpone the Obtained Quarter up to Maximum Quarter
# If there are fines/penalties (delayPenalty) to be paid to other companies or to employees, pay them.
# If company needs to cancel, then pay penalty.

# If either side changes terms in contract then make possible already signed side unsigned.

# Delete all unsigned contracts at the end of decision phase of each quarter.
# Pay all advance payments at the end of decision phase of each quarter.
# Insert cost in financial statement tables


# Example of older Trigger implemented (insert is useful, update maybe will be depreciated). 

    execute <<-SQL
      CREATE FUNCTION check_insert() RETURNS TRIGGER AS
        $BODY$
        DECLARE
          avail boolean;
          system integer;
          seller_id integer;
          quarterO_id integer;
          resale boolean;
        BEGIN
          IF NEW.buyer_id = NEW.seller_id THEN
            RAISE EXCEPTION 'You cannot sell an item to your company!';
          ELSEIF (NEW.quarterO_id<=NEW.quarter_id) OR (NEW.quarterM<NEW.quarterO_id) THEN
                RAISE EXCEPTION 'Program Error! Quarter obtained is not in the future!';
          END IF;
          avail = (SELECT avail FROM prod_chars WHERE id=NEW.prod_id);
          IF avail = true THEN
            RAISE EXCEPTION 'Program Error! The selected product is not RnD and cannot be sold!';
          ELSEIF NEW.quarter_id < avail THEN
            RAISE EXCEPTION 'Program Error! The selected product is not available yet!';
          END IF;
  
          system = (SELECT MIN(id) FROM companies);
          IF NEW.seller_id!=system THEN
            seller_id = NULL;
            SELECT id, quarterO_id, saleRightsB INTO seller_id, quarterO_id, resale FROM comp_rnds
                WHERE buyer_id=NEW.seller_id AND prod_id=NEW.prod_id AND cancelled=false AND signedS=true AND signedB=true;
            IF seller_id IS NULL THEN
              RAISE EXCEPTION 'You cannot sell an item that you do not possess!';
            ELSEIF resale IS FALSE THEN
              RAISE EXCEPTION 'You do not have the rights to sell this RnD';
            ELSEIF NEW.quarterO_id < quarterO_id THEN
              RAISE EXCEPTION 'RnD will not be ready the time you want to sell it.\n Please change the quarter!';           
            END IF;
          END IF;
  
  
          IF (SELECT id FROM comp_rnds WHERE
              seller_id=NEW.seller_id AND buyer_id=NEW.buyer_id AND prod_id=NEW.prod_id AND cancelled=false) IS NOT NULL OR
              (SELECT id FROM comp_rnds WHERE
              seller_id=NEW.buyer_id AND buyer_id=NEW.seller_id AND prod_id=NEW.prod_id AND cancelled=false) IS NOT NULL THEN
            RAISE EXCEPTION 'There is another contract in progress for the same product and between the same companies!';
          END IF;
        END;
      $BODY$
      LANGUAGE plpgsql
    SQL

    execute <<-SQL
      CREATE TRIGGER man01 BEFORE INSERT ON comp_rnds
      FOR EACH ROW
      EXECUTE PROCEDURE check_insert();
    SQL


=begin

    execute <<-SQL
      CREATE FUNCTION check_update() RETURNS TRIGGER AS
        $BODY$
        DECLARE
          quarter integer;
          system integer;
          penalty integer;
          remaining integer;
          aplagemizw integer;
        BEGIN
          quarter = (SELECT MAX(id) FROM quarters);
          system = (SELECT MIN(id) FROM companies);
          -- aftomata delete prepei na kanw se ola ta unsigned sto telos tou ekastote eksaminou
          IF OLD.seller_id!=NEW.seller_id OR OLD.buyer_id!=NEW.buyer_id OR OLD.prod_id!=NEW.prod_id OR OLD.quarter_id!=NEW.quarter_id THEN
            RAISE EXCEPTION 'Sign another contract. seller_id, buyer_id, product and quarter cannot be modified!'; 
          ELSEIF (OLD.cancelled IS TRUE) AND (NEW.cancelled IS FALSE) THEN
            RAISE EXCEPTION 'The contract is locked, because it has already been rejected or failed!'; 
          ELSEIF (OLD.signedS IS TRUE) AND (OLD.signedB IS TRUE) THEN
  
            NEW.quarterO_id=OLD.quarterO_id;
            NEW.quarterM=OLD.quarterM;
            NEW.price=OLD.price;
            NEW.advancePayment=OLD.advancePayment;
            NEW.penalty=OLD.penalty;
            NEW.delayPenalty=OLD.delayPenalty;
            NEW.resaleRightsS=OLD.resaleRightsS;
            NEW.resaleRightsB=OLD.resaleRightsB;
            NEW.signedS=OLD.signedS;
            NEW.signedB=OLD.signedB;
  
            IF (NEW.seller_id = system) THEN
              -- check sta oikonomika an vgainei na ependusei (den einai tokoglufo h den prokeitai na mpei)
                IF (NEW.quarterO_id = quarter) THEN -- kai den mporei na antepekselthei oikonomika (flag apo prin)
                  penalty = NEW.delayPenalty; 
                  penalty = (SELECT 
                      SUM(case when quarterM=quarter then penalty when quarterM>quarter then delayPenalty else 0 end)
                      FROM comp_rnds
                      WHERE seller_id=NEW.buyer_id AND prod_id=NEW.prod_id AND quarterO_id=quarter AND cancelled=false);
                  IF (penalty < NEW.price) THEN
                    -- to cancel sto sumvolaio pou exei plirwthei h rhtra tha ginei meta me elegxo ston pinaka twn agorwn
                    IF (NEW.quarterO_id=NEW.quarter_id+1) THEN
                      NEW.cancelled=true;
                    ELSE
                      NEW.quarterO_id=NEW.quarterO_id+1;
                      remaining = NEW.quarterO_id-quarter;
                      NEW.price = NEW.price*(remaining+1)/remaining;
                      -- insert sta oikonomika to kostos kathisterisis enos triminou tou RnD (delayPenalty)
                    END IF;
                  ELSE         
                    -- insert sta oikonomika ta kosth gia oloklhrwsh RnD
                    INSERT INTO comp_rnds (company_id, prod, quarterO_id)
                    VALUES (NEW.seller_id, NEW.prod_id, quarter);
                  END IF;
                ELSEIF (NEW.quarterO_id > quarter) THEN
                  IF (NEW.quarter_id=quarter) THEN
                    NEW.cancelled=true;
                  ELSE
                    remaining = NEW.quarterO_id-quarter;
                    NEW.price = NEW.price*(remaining+1)/remaining;
                    -- insert sta oikonomika to kostos kathisterisis gia ton agorasth enos triminou tou RnD (delayPenalty)
                  END IF;
                END IF;
              -- ELSEIF (quarterO_id >= quarter) THEN ta kosth gia epomeno vhma RnD
            
  
            ELSEIF (NEW.cancelled IS TRUE) AND (NEW.quarterM >= quarter) THEN
              aplagemizw=0; -- insert sta oikonomika tis ritres + delays
            ELSE
              RAISE EXCEPTION 'The contract is locked, because it has already been signed!';
            END IF;
  
  
          ELSEIF NEW.quarterO_id <
                (SELECT quarterO_id FROM comp_rnds WHERE buyer_id=NEW.seller_id AND prod_id=NEW.prod_id AND cancelled=false) THEN
            RAISE EXCEPTION 'RnD will not be ready the time you want to sell it.\n Please change the quarter!'; 
          ELSEIF OLD.quarterO_id!=NEW.quarterO_id OR OLD.quarterM!=NEW.quarterM OR OLD.price!=NEW.price OR
              OLD.advancePayment!=NEW.advancePayment OR OLD.penalty!=NEW.penalty OR OLD.delayPenalty!=NEW.delayPenalty OR
              OLD.resaleRightsS!=NEW.resaleRightsS OR OLD.resaleRightsB!=NEW.resaleRightsB THEN
            IF (OLD.signedS IS TRUE) THEN
              NEW.signedS = false;
            ELSEIF (OLD.signedB IS TRUE) THEN
              NEW.signedB = false;
            END IF;
          ELSEIF (NEW.signedS IS TRUE) AND (NEW.signedB IS TRUE) THEN
            IF ((SELECT id FROM comp_rnds WHERE company_id=NEW.buyer_id AND prod_id=NEW.prod_id) IS NULL) THEN
              aplagemizw=0; -- edw insert into oikonomika ta advancePayment
            ELSE
              NEW.cancelled = true;
              NEW.signedS = false;
              NEW.signedB = false;
            END IF;
          END IF;
        END;
      $BODY$
      LANGUAGE plpgsql
    SQL

    execute <<-SQL
      CREATE TRIGGER man02 BEFORE UPDATE ON comp_rnds
      FOR EACH ROW
      EXECUTE PROCEDURE check_update();
    SQL
=end

  end
end
