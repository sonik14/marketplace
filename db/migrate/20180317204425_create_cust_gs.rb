class CreateCustGs < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_gs do |t|

      t.timestamps
    end
  end
end
