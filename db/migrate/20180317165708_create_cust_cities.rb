class CreateCustCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_cities do |t|

      t.belongs_to :city, foreign_key: true, null: false
      t.belongs_to :customer, foreign_key: true, null: false

      t.string     :name
      t.integer    :price, unsigned: true #willing
      t.integer    :EducationEC, unsigned: true #education of employees
      t.integer    :marketsize, unsigned: true #how many they are
      t.decimal    :marketsizeCustPer, precision: 4, scale: 2
      # marketsizeTotPer: 0.000 to 99.999%: for viewing statistics and used only if simulation for demand is executed once and then split to cities depending on this percent
      t.decimal    :marketsizeTotPer, unsigned: true, precision: 5, scale: 3
      t.decimal    :marketsizeCustRmin, unsigned: true, precision: 5, scale: 4
      t.decimal    :marketsizeCustRmax, unsigned: true, precision: 5, scale: 4
      # precision 6, scale 5 is selected because minMarketsize(cust_city)/sumMarketsize = 1388/40908199 = 0.00003
      t.decimal    :marketsizeTotRmin, unsigned: true, precision: 6, scale: 5
      t.decimal    :marketsizeTotRmax, unsigned: true, precision: 6, scale: 5
      t.timestamps
    end
    add_index :cust_cities, [:city_id, :customer_id], unique: true
  end
end
