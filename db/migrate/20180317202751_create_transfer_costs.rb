class CreateTransferCosts < ActiveRecord::Migration[5.0]
  def change
    create_table :transfer_costs do |t|

      t.integer :name1_id, null: false
      t.integer :name2_id, null: false
      t.belongs_to :function, foreign_key: true

      t.integer :distance, unsigned: true #x in function: distance between the two continents

      t.timestamps
    end
    add_foreign_key :transfer_costs, :continents, column: :name1_id
    add_foreign_key :transfer_costs, :continents, column: :name2_id
    # replace continents with cities if you want to make it different per city
    add_index :transfer_costs, [:name1_id, :name2_id], unique: true
  end
end
