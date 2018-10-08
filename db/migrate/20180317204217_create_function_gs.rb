class CreateFunctionGs < ActiveRecord::Migration[5.0]
  def change
    create_table :function_gs do |t|
      t.belongs_to :game, foreign_key: true, null: false, index: true 
      t.belongs_to :function_usage, foreign_key: true, null: false
      t.belongs_to :function, foreign_key: true # limit selections depending on function usage choice per game
      
      t.float :parA
      t.float :parB
      t.float :parC
      t.float :parD
      t.timestamps
    end
    add_index :function_gs, [:function_usage_id, :game_id], unique: true
  end
end
