class CreateCustGs < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_gs do |t|

      t.belongs_to :customer, foreign_key: true, null: false
      t.belongs_to :game, foreign_key: true, null: false

      t.decimal :rebuyPer, unsigned: true, precision: 3, scale: 2 # see customers
      t.integer :rebuyInterval, unsigned: true, limit: 1 # quarters

      t.timestamps
    end
    add_index :cust_gs, [:customer_id, :game_id], unique: true, index: true
  end
end
