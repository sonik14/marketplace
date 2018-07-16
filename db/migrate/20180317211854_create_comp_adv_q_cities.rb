class CreateCompAdvQCities < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_adv_q_cities do |t|

      t.belongs_to :comp_adv_q, foreign_key: true, null: false
      t.belongs_to :city, foreign_key: true, null: false

      t.integer :appearancesNo, unsigned: true, limit: 1
      t.timestamps
    end
    add_index :comp_adv_q_cities, [:comp_adv_q_id, :city_id], unique: true
  end
end
