class CreateFunctionQs < ActiveRecord::Migration[5.0]
  def change
    create_table :function_qs do |t|
      t.belongs_to :quarter, foreign_key: true, null: false, index: true
      t.belongs_to :function_usage, foreign_key: true, null: false
      t.belongs_to :function, foreign_key: true
      
      t.float :parA
      t.float :parB
      t.float :parC
      t.float :parD
      
      t.timestamps
    end
    add_index :function_qs, [:function_usage_id, :quarter_id], unique: true
  end
end
