class CreateCustCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_cities do |t|

      t.belongs_to :city, foreign_key: true, null: false
      t.belongs_to :customer, foreign_key: true, null: false
      t.integer    :price, unsigned: true #willing
      t.integer    :marketsize, unsigned: true #how many they are
      t.integer    :EducationEC, unsigned: true #education of employees
      t.numrange   :marketsize_range
      t.timestamps
    end
    add_index :cust_cities, [:city_id, :customer_id], unique: true
  end
end
