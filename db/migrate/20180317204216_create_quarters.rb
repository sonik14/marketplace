class CreateQuarters < ActiveRecord::Migration[5.0]
  def change
    create_table :quarters do |t|

      t.belongs_to :game, foreign_key: true, null: false
      t.integer :first_month_id
      
      t.integer :func_demand_id
      t.decimal :parA
      t.decimal :parB
      t.decimal :parC
      t.decimal :parD

      t.decimal :rangeDemandPer, unsigned: true, precision: 3, scale: 2
      
      t.integer :funding_amount_max, unsigned: true
      t.timestamps
    end
    add_foreign_key :quarters, :games, column: :first_month_id
    add_foreign_key :quarters, :functions, column: :func_demand_id
    add_index :quarters, [:game_id, :first_month_id], unique: true
  end
end
