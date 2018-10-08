class CreateCustGFuncs < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_g_funcs do |t|
      t.belongs_to :customer, foreign_key: true, null: false
      t.belongs_to :game, foreign_key: true, null: false, index: true
      t.belongs_to :function_usage, foreign_key: true, null: false
      t.belongs_to :function, foreign_key: true
      t.belongs_to :cust_func, foreign_key: true
      
      t.float :parA
      t.float :parB
      t.float :parC
      t.float :parD
      
      t.timestamps
    end
    add_index :cust_g_funcs, [:customer_id, :function_usage_id, :game_id], unique: true, name: 'index_cust_g_funcs_on_cust_id_and_function_id_and_g_id'
  end
end
