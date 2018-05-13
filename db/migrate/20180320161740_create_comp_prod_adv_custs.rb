class CreateCompProdAdvCusts < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_prod_adv_custs do |t|

      t.belongs_to :comp_prod, foreign_key: true, null: false
      t.belongs_to :comp_adv, foreign_key: true, null: false
      t.belongs_to :customer, foreign_key: true, null: false
	  # Evaluation of each Advertisment for each customer for each product

      t.integer :advEval, unsigned: true, limit: 1
      t.timestamps
    end
    add_index :comp_prod_adv_custs, [:comp_prod_id, :comp_adv_id, :customer_id], unique: true, name: 'index_comp_prod_adv_custs_on_comp_prod_comp_adv_customer'
  end
end
