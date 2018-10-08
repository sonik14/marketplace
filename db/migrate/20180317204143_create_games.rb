class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|

      t.belongs_to :version, foreign_key: true, null: false

      t.string  :name, index: true, null: false
      t.integer :first_month_id
      t.integer :starting_year, unsigned: true
      t.integer :duration, unsigned: true, limit: 1
      t.integer :trainExtraAvail, unsigned: true, limit: 1
      t.integer :illPer, unsigned: true, limit: 1 # within range of ill_percent_max in version table
      # percent of customers who will reject a company for their next buy, if they faced shortage of product the previous quarter
      t.date    :autodelete, default: nil
      t.integer :current_quarter, unsigned: true, limit: 1
      t.boolean :finished, default: false
      t.timestamps
    end
    add_foreign_key :games, :months, column: :first_month_id, null: false
    add_index :games, [:version_id, :name], unique: true
  end
end
