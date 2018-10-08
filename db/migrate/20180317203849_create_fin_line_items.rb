class CreateFinLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :fin_line_items do |t|

      t.belongs_to :financial_statement, foreign_key: true, null: false

      t.string :name, index: true, null: false
      t.belongs_to :function, foreign_key: true # function to calculate it
      t.boolean :revenue, null: false, default: true # indicates if it is revenue or expense
      t.timestamps
    end
    add_index :fin_line_items, [:financial_statement_id, :name], unique: true
  end
end
