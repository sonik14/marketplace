class CreateCustQFuncs < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_q_funcs do |t|
      t.belongs_to :cust_func, foreign_key: true, null: false
      t.belongs_to :quarter, foreign_key: true, null: false, index: true
      
      t.float :parA
      t.float :parB
      t.float :parC
      t.float :parD
      
      t.timestamps
    end
    add_index :cust_q_funcs, [:cust_func_id, :quarter_id], unique: true
  end
end
