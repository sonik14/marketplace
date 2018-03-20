class CreateCustCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_cities do |t|

      t.timestamps
    end
  end
end
