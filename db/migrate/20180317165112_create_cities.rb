class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.belongs_to :continent, foreign_key: true, null: false

      t.string :name, index: true, null: false
      t.integer :population, unsigned: true
      t.integer :marketsize, unsigned: true
      t.decimal :marketsizePer, unsigned: true, precision: 4, scale: 2  # 0.00 to 99.99% (100% mean only one city has population [false])
      t.decimal :marketsizeRmin, unsigned: true, precision: 5, scale: 4
      t.decimal :marketsizeRmax, unsigned: true, precision: 5, scale: 4
      # min Range (in the whole project) is not needed by the algorithms so far, if you process the entries in ascending order.
      # it exists for better maintainability and for better visuals.
      t.integer :advC, unsigned: true
      t.timestamps
    end
    add_index :cities, [:continent_id, :name], unique: true
  end
end
