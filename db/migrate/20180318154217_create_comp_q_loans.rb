class CreateCompQLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_q_loans do |t|

      t.belongs_to :loan, foreign_key: true, null: false
      t.belongs_to :comp_q, foreign_key: true, null: false

      t.integer :shares, unsigned: true, default: 0
      t.integer :amount, unsigned: true
      t.integer :duration, unsigned: true
      t.timestamps
    end
    add_index :comp_q_loans, [:loan_id, :comp_q_id], unique: true
  end
end
