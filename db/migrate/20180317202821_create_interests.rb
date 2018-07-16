class CreateInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :interests do |t|

      t.belongs_to :function, foreign_key: true
      
      t.string :usage, unique: true, null: false
      t.decimal :interest, precision: 3, scale: 2
      # if function is null and is fixed interest rate, independent of amount of money
      t.timestamps
    end
  end
end
