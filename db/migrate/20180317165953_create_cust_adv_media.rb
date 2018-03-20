class CreateCustAdvMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_adv_media do |t|

      t.timestamps
    end
  end
end
