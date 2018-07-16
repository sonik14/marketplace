class CreateHealthConts < ActiveRecord::Migration[5.0]
  def change
    create_table :health_conts do |t|

      t.belongs_to :health, foreign_key: true, null: false
      t.belongs_to :continent, foreign_key: true, null: false
      
      t.integer :CPP, unsigned: true #cost per person
      t.timestamps
    end
    add_index :health_conts, [:health_id, :continent_id], unique: true
  end
end
