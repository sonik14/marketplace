class CreateCustProdChars < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_prod_chars do |t|

      t.belongs_to :prod_char, foreign_key: true, null: false
      t.belongs_to :customer, foreign_key: true, null: false
      # If assumption that every type of customer has in every city different preferences
      # then use foreign key cust_city instead of customer (change index + relevant adv also)

      t.decimal :weight, unsigned: true, precision: 3, scale: 2 #b sti [M] #0 adiaforei gia to xarakthristiko
      t.integer :scale #gia ton kathe typo katanalwth, poio scale poiothtas ths ekastote kathgorias thelei
      #sto 0 simainei oti den thelei na yparxei
      
      t.timestamps
    end
    add_index :cust_prod_chars, [:prod_char_id, :customer_id], unique: true
  end
end
