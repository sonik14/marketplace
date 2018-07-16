class CreateHealths < ActiveRecord::Migration[5.0]
  def change
    create_table :healths do |t|

      t.belongs_to :version, foreign_key: true, null: false

      t.string :name, unique: true, index: true, null: false
      t.timestamps
    end
  end
end
