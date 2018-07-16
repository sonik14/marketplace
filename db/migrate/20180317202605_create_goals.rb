class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|

      t.belongs_to :version, foreign_key: true, null: false

      t.string :name, unique: true, null: false
      t.timestamps
    end
  end
end
