class CreateNeedScores < ActiveRecord::Migration[5.0]
  def change
    create_table :need_scores do |t|

      t.timestamps
    end
  end
end
