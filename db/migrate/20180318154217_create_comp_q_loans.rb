class CreateCompQLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_q_loans do |t|

      t.timestamps
    end
  end
end
