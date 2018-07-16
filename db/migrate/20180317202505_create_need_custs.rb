class CreateNeedCusts < ActiveRecord::Migration[5.0]
  def change
    create_table :need_custs do |t|

      t.belongs_to :need, foreign_key: true, index: true, null: false
      t.belongs_to :customer, foreign_key: true, index: true, null: false

      # Shows which parameters influence each particular need
      t.binary :interest, limit: 5, default: 10000
      # bitwise logic (1 true => influences, 0 false => does not influence)
      # 1234 => 1=>prod_char, 2=>adv, 3=>price, 4=>quality, 5=>need_score
      # if for 5 there is no row in need_score, then this bit is 0

      # for adv and quality there are subcategories (see customer table)
      t.binary :subI2, limit: 3, default: 0 
      # 1=>a_generalI, 2=>a_prod_nameI, 3=>a_char_orderI
      t.binary :subI4, limit: 4, default: 0 
      # 1=>q_D1Reliability(R)SI, 2=>q_D2ReputationSI, 3=>q_D3RealAdvSI, 4=>q_D4DiscountSI

      # We have assumed that each parameter(bit) has an equal influence.
      # ex: 10100 => 50% prod_chars related to this need and 50% price.
      # Alternatively you can have one boolean variable for each preference.
      # In that case, seperate variables are essential (in total 9 vars).

      # Edw fainontai ti kai poso endiaferoun ton sygkekrimeno typo katanalwth.
      # Arxika vriskoume ti (se afton ton pinaka - proigoumenes metavlites)
      # Gia afta pou ton endiaferoun vgainei o mesos oros apo to interest/weight
      # gia to kathe xarakthristiko/feature/idiothta (posu polu thelei thn yparksh tou o katanalwths)
      # apo tous pinakes cust_prod_char, customer, need_score.
      t.decimal :score, unsigned: true, precision: 3, scale: 2 
      # total score (avg of weights/interests) for this need for that type of customer
      # maybe the display score will be needed to be normalized

      t.timestamps
    end
    add_index :need_custs, [:need_id, :customer_id], unique: true
  end
end
