class CreateCustCategoryAdvs < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_category_advs do |t|

      t.belongs_to :category_adv, foreign_key: true, null: false
      t.belongs_to :customer, foreign_key: true, null: false

      # no usability yet

      t.timestamps
    end
    add_index :cust_category_advs, [:category_adv_id, :customer_id], unique: true
  end
end
