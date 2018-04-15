class CreateFinancialStatements < ActiveRecord::Migration[5.0]
  def change
    create_table :financial_statements do |t|

      t.belongs_to :version, foreign_key: true, null: false

      t.string :type, unique: true, index: true, null: false # cash, balance, income sheets
      t.timestamps
    end
  end
end
