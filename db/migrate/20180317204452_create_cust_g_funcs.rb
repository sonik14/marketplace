class CreateCustGFuncs < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_g_funcs do |t|

      t.timestamps
    end
  end
end
