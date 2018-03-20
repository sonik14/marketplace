class CreateCustProdChars < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_prod_chars do |t|

      t.timestamps
    end
  end
end
