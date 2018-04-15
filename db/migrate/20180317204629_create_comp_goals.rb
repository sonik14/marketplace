class CreateCompGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_goals do |t|

      t.belongs_to :company, foreign_key: true
      t.belongs_to :goal, foreign_key: true
      t.boolean :chosen
      t.timestamps
    end
    add_index :comp_goals, [:company_id, :goal_id], unique: true
  end
end