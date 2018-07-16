class CreateCompQStoreCusts < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_q_store_custs do |t|

      t.belongs_to :comp_q_store, foreign_key: true, null: false
      t.belongs_to :customer, foreign_key: true, null: false

      t.integer :NoE, unsigned: true, limit: 1
      t.integer :salesPE, unsigned: true
      t.integer :bonusPE, unsigned: true
      t.integer :giftPE, unsigned: true
      t.integer :TotSalary, unsigned: true #salaryE*NoE + NoE*(all kind of bonus in money)
      t.integer :TotNoSales, unsigned: true #only statistical
      t.timestamps
    end
    add_index :comp_q_store_custs, [:comp_q_store_id, :customer_id], unique: true
  end
end
