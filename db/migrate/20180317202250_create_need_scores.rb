class CreateNeedScores < ActiveRecord::Migration[5.0]
  def change
    create_table :need_scores do |t|

      t.belongs_to :need, foreign_key: true, index: true, null: false
      t.belongs_to :score, foreign_key: true, index: true, null: false

      t.decimal :weight, precision: 3, scale: 2 # the positive sums up to 1
      # (if all extra scores are included => need is fulfiled [from the aspect of scores])
      # can also be negative influence if a prod_char exists
      t.timestamps
    end
  end
end
