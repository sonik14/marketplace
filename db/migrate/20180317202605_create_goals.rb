class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|

      t.belongs_to :version, foreign_key: true, null: false

      t.string :name, null: false
      t.timestamps
    end
    add_index :goals, [:version_id, :name], unique: true
  end
end
