class CreateCompQTrains < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_q_trains do |t|

      t.belongs_to :comp_q, foreign_key: true, null: false
      t.belongs_to :train, foreign_key: true, null: false
      # t.belongs_to :q, foreign_key: true
      t.integer :CPP, unsigned: true
      t.timestamps
    end
    add_index :comp_q_trains, [:comp_q_id, :train_id], unique: true
  end
end
