class CreateCompProdAdvs < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_prod_advs do |t|

      t.timestamps
    end
  end
end
