class CreateMonths < ActiveRecord::Migration[5.0]
  def change
    create_table :months do |t|

      t.belongs_to :version, foreign_key: true, null: false
      
      t.integer :no, unsigned: true, null: false
      t.string  :name, index: true, null: false, unique: true
      t.integer :noDays, unsigned: true, index: true, null: false, default: 30
      t.decimal :seasonPer, precision: 6, scale: 2, default: 100.00
      # find 2 KKMO(12) and then each LE
      # the following two will be used only if every month of every year will be stored in the database
      # example: January 2018 and then January 2019 etc
      # if you want a calendar then include the following code and add unique of year and no + year and name
=begin
      t.integer :year, unsigned: true, null: false, index: true
      t.integer :firstDayNo, unsigned: true
      t.string  :firstDayName
=end
	  # if noDays=28 -> firstDayNo of next month = (firstDayNo+0)mod7
	  # if noDays=30 -> firstDayNo of next month = (firstDayNo+2)mod7
	  # if noDays=31 -> firstDayNo of next month = (firstDayNo+3)mod7
      t.timestamps
    end
    add_index :months, [:version_id, :no], unique: true
  end
end
