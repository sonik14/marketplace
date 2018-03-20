class CreateCustAdvChars < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_adv_chars do |t|

      t.timestamps
    end
  end
end
