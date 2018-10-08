class CreateFinancialStatements < ActiveRecord::Migration[5.0]
  def change
    create_table :financial_statements do |t|

      t.belongs_to :version, foreign_key: true, null: false

      t.string :name, index: true, null: false # usage: cash, balance, income sheets
      t.timestamps
    end
    add_index :financial_statements, [:version_id, :name], unique: true
  end
end
