class CreateFinLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :fin_line_items do |t|

      t.belongs_to :financial_statement, foreign_key: true, null: false

      t.string :name, unique: true, index: true, null: false # cash, balance, income sheets
      t.belongs_to :function, foreign_key: true # function to calculate it
      t.boolean :revenue, null: false, default: true # indicates if it is revenue or expense
      t.timestamps
    end
  end
end
