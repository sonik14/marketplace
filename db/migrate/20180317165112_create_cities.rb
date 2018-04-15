class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|

      t.string :name, unique: true, index: true, null: false
      t.integer :population, unsigned: true
      t.belongs_to :continent, foreign_key: true, null: false
      t.integer :advC, unsigned: true

      #   t.integer :marketsize, unsigned: true
      t.timestamps
    end
  end
end
