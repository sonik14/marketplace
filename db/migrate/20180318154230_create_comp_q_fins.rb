class CreateCompQFins < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_q_fins do |t|

      t.belongs_to :fin_line_item, foreign_key: true, null: false
      t.belongs_to :comp_q, foreign_key: true, null: false

      t.integer :value, unsigned: true
      t.timestamps
    end
    add_index :comp_q_fins, [:fin_line_item_id, :comp_q_id], unique: true
  end
end
