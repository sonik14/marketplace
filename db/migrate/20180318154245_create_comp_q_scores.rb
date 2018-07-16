class CreateCompQScores < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_q_scores do |t|

      t.belongs_to :score, foreign_key: true, null: false
      t.belongs_to :comp_q, foreign_key: true, null: false

      t.decimal :score, unsigned: true, precision: 8, scale: 2
      t.timestamps
    end
    add_index :comp_q_scores, [:score_id, :comp_q_id], unique: true
  end
end
