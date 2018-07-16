class CreateMonths < ActiveRecord::Migration[5.0]
  def change
    create_table :months do |t|

      t.belongs_to :version, foreign_key: true, null: false
      
      t.integer :no, unsigned: true
      t.string  :name, index: true, null: false
      t.integer :noDays, unsigned: true, index: true, null: false, default: 30
      t.decimal :seasonPer, precision: 6, scale: 2
      # find 2 KKMO(12) and then each LE
      # the following two will be used only if every month of every year will be stored in the database
      # example: January 2018 and then January 2019 etc
      t.integer :firstDayNo, unsigned: true
      t.string  :firstDayName
	  # if noDays=28 -> firstDayNo of next month = (firstDayNo+0)mod7
	  # if noDays=30 -> firstDayNo of next month = (firstDayNo+2)mod7
	  # if noDays=31 -> firstDayNo of next month = (firstDayNo+3)mod7
      t.timestamps
    end
  end
end
