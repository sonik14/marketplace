class CreateCompQCustCities < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_q_cust_cities do |t|

      t.timestamps
    end
  end
end
