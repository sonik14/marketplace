class CreateCustGs < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_gs do |t|

      t.belongs_to :customer, foreign_key: true, null: false
      t.belongs_to :game, foreign_key: true, null: false

      t.decimal :rebuyPer, unsigned: true, precision: 2, scale: 0 # see customers
      t.integer :rebuyInterval, unsigned: true, limit: 1 # quarters
      t.decimal :A1_prod_char_SI, unsigned: true, precision: 2, scale: 0 #3 #weight, sensitivity
      t.decimal :A2_adv_char_SI, unsigned: true, precision: 2, scale: 0 #2
      t.decimal :A3_price_SI, unsigned: true, precision: 2, scale: 0 #1
      t.decimal :A4_quality_SI, unsigned: true, precision: 2, scale: 0 #0 #sum 1
      #ranges from customer table (random default between range)
      t.timestamps
    end
    add_index :cust_gs, [:customer_id, :game_id], unique: true
  end
end
