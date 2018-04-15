class CreateTransferCosts < ActiveRecord::Migration[5.0]
  def change
    create_table :transfer_costs do |t|

      t.integer :name1_id, null: false
      t.integer :name2_id, null: false
      t.belongs_to :function, foreign_key: true

      t.timestamps
    end
    add_foreign_key :transfer_costs, :continents, column: :name1_id
    add_foreign_key :transfer_costs, :continents, column: :name2_id
    add_index :transfer_costs, [:name1_id, :name2_id], unique: true
  end
end
