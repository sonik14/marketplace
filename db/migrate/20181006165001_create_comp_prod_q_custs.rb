class CreateCompProdQCusts < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_prod_q_custs do |t|

      t.belongs_to :comp_prod, foreign_key: true, null: false
      t.belongs_to :quarter, foreign_key: true, null: false
      t.belongs_to :customer, foreign_key: true, null: false

      t.integer :TotEval, unsigned: true, limit: 1
      t.integer :noD, unsigned: true #no of demand
      t.integer :noB, unsigned: true #no of buys
      t.timestamps
    end
    add_index :comp_prod_q_custs, [:comp_prod_id, :quarter_id, :customer_id], unique: true, name: 'index_comp_prod_q_custs_on_comp_prod_per_q_per_cust'
  end
end
