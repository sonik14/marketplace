class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.belongs_to :continent, foreign_key: true, null: false

      t.string :name, unique: true, index: true, null: false
      t.integer :population, unsigned: true
      t.integer :marketsize, unsigned: true
      t.decimal :marketsizePer, unsigned: true, precision: 4, scale: 2
      t.decimal :marketsizeRmin, unsigned: true, precision: 5, scale: 4
      t.decimal :marketsizeRmax, unsigned: true, precision: 5, scale: 4
      t.integer :advC, unsigned: true
      t.timestamps
    end
  end
end
