class CreateCompProdQStores < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_prod_q_stores do |t|

      t.timestamps
    end
  end
end
