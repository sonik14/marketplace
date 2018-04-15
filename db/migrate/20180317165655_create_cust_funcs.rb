class CreateCustFuncs < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_funcs do |t|

      t.belongs_to :customer, foreign_key: true, null: false, index: true
      t.belongs_to :function, foreign_key: true, null: false
      t.numrange :parA
      t.numrange :parB
      t.numrange :parC
      t.numrange :parD

      t.timestamps
    end
    add_index :cust_funcs, [:customer_id, :function_id], unique: true
  end
end
