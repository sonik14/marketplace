class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|

      t.belongs_to :interest, foreign_key: true, null: false

      t.string :name, null: false #usage
      t.boolean :shares_danger, null: false, default: false # true for loan shark
      t.timestamps
    end
    add_index :loans, [:interest_id, :name], unique: true
  end
end
