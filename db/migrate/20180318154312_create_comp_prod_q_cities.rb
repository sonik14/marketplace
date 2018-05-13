class CreateCompProdQCities < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_prod_q_cities do |t|

      t.belongs_to :comp_prod_q, foreign_key: true, null: false
      t.belongs_to :city, foreign_key: true, null: false

      t.integer :advAVGEval, unsigned: true, limit: 1
      t.integer :pricedEval, unsigned: true, limit: 1
      t.integer :qualityEval, unsigned: true, limit: 1
      t.timestamps
    end
    add_index :comp_prod_q_cities, [:comp_prod_q_id, :city_id], unique: true
  end
end
