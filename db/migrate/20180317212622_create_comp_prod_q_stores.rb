class CreateCompProdQStores < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_prod_q_stores do |t|

      t.belongs_to :comp_prod_q, foreign_key: true, null: false
      # you can connect with comp_prod without any difference to the result
      # best automization though will be achieved with comp_prod_q
      t.belongs_to :comp_q_store, foreign_key: true, null: false

      t.integer :salesNo, unsigned: true #will sum up to comp_q_stores
      t.integer :TotC, unsigned: true #kostos proiontos*salesNo - will sum up to comp_q_stores
      t.integer :price, unsigned: true
      t.integer :discount, unsigned: true
      t.integer :Seq, unsigned: true #sequence in selfs of stores (1 in the most visible self etc)
      t.boolean :promotionPrior, default: false #promotion Priority of the Employees

      t.integer :priceEval, unsigned: true, limit: 1

      t.timestamps
    end
    add_index :comp_prod_q_stores, [:comp_prod_q_id, :comp_q_store_id], unique: true
  end
end
