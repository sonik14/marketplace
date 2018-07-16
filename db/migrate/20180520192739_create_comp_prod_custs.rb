class CreateCompProdCusts < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_prod_custs do |t|

      t.belongs_to :comp_prod, foreign_key: true, null: false
      t.belongs_to :customer, foreign_key: true, null: false

      t.integer :prodEval, unsigned: true, limit: 1
      t.timestamps
    end
    add_index :comp_prod_custs, [:comp_prod_id, :customer_id], unique: true
  end
end
