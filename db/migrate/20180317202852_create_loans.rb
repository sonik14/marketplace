class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|

      t.belongs_to :interest, foreign_key: true, null: false

      t.string :type, unique: true, null: false
      t.boolean :shares_danger, null: false, default: false # true for loan shark
      t.timestamps
    end
  end
end
