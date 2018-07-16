class CreateCustFuncs < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_funcs do |t|

      t.belongs_to :customer, foreign_key: true, null: false, index: true
      t.belongs_to :function, foreign_key: true, null: false

      t.float  :parAmin
      t.float  :parAmax
      t.float  :parAdef
      t.float  :parBmin
      t.float  :parBmax
      t.float  :parBdef
      t.float  :parCmin
      t.float  :parCmax
      t.float  :parCdef
      t.float  :parDmin
      t.float  :parDmax
      t.float  :parDdef

      t.timestamps
    end
    add_index :cust_funcs, [:customer_id, :function_id], unique: true
  end
end
