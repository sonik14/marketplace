class CreateCustGMqCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_g_mq_cities do |t|

      t.timestamps
    end
  end
end
