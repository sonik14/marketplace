class CreateCustAdvChars < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_adv_chars do |t|

      t.belongs_to :adv_char, foreign_key: true, null: false
      t.belongs_to :customer, foreign_key: true, null: false

      t.decimal :weight, unsigned: true, precision: 3, scale: 2 #0 adiaforei gia to xarakthristiko
      t.integer :scale #gia ton kathe typo katanalwth, poio scale poiothtas ths ekastote kathgorias thelei
      #sto 0 simainei oti den thelei na yparxei
      
      t.timestamps
    end
    add_index :cust_adv_chars, [:adv_char_id, :customer_id], unique: true
  end
end
