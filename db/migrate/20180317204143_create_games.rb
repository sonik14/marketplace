class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|

      t.belongs_to :version, foreign_key: true, null: false

      t.integer :first_month_id
      t.integer :starting_year, unsigned: true
      t.integer :duration, unsigned: true, limit: 1
      t.integer :func_changeover_id
      t.integer :trainExtraAvail, unsigned: true, limit: 1
      t.decimal :illPer, unsigned: true, precision: 3, scale: 2 # within range of ill_percent_max in version table
      # percent of customers who will reject a company for their next buy, if they faced shortage of product the previous quarter
      t.date    :autodelete, default: nil
      t.integer :current_quarter, unsigned: true, limit: 1
      t.timestamps
    end
    add_foreign_key :games, :months, column: :first_month_id
    add_foreign_key :games, :functions, column: :func_changeover_id
  end
end
