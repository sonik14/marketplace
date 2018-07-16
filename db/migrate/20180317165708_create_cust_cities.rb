class CreateCustCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_cities do |t|

      t.belongs_to :city, foreign_key: true, null: false
      t.belongs_to :customer, foreign_key: true, null: false
      t.integer    :price, unsigned: true #willing
      t.integer    :EducationEC, unsigned: true #education of employees
      t.integer    :marketsize, unsigned: true #how many they are
      t.decimal    :marketsizePer, unsigned: true, precision: 4, scale: 2
      t.decimal    :marketsizeRmin, unsigned: true, precision: 5, scale: 4
      t.decimal    :marketsizeRmax, unsigned: true, precision: 5, scale: 4
      t.decimal    :marketsizeTotRmin, unsigned: true, precision: 5, scale: 4
      t.decimal    :marketsizeTotRmax, unsigned: true, precision: 5, scale: 4
      t.timestamps
    end
    add_index :cust_cities, [:city_id, :customer_id], unique: true
  end
end
