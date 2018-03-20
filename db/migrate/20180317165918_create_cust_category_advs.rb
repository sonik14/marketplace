class CreateCustCategoryAdvs < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_category_advs do |t|

      t.timestamps
    end
  end
end
