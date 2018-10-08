class CreateCompQSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_q_searches do |t|

      t.belongs_to :comp_q, foreign_key: true, null: false
      t.belongs_to :continent, foreign_key: true, null: false

      t.boolean :avail, unsigned: true
      t.timestamps
    end
    add_index :comp_q_searches, [:comp_q_id, :continent_id], unique: true
  end
end
