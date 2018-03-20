class CreateCustFuncs < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_funcs do |t|

      t.timestamps
    end
  end
end
