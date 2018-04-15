class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|

      t.belongs_to :version, foreign_key: true, null: false

      t.string :name, unique: true, index: true, null: false
      t.belongs_to :function, foreign_key: true
      t.timestamps
    end
  end
end
