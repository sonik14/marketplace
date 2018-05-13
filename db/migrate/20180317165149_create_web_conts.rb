class CreateWebConts < ActiveRecord::Migration[5.0]
  def change
    create_table :web_conts do |t|

      t.belongs_to :web_feature, foreign_key: true, null: false
      t.belongs_to :continent, foreign_key: true, null: false
      
      t.integer :initC, unsigned: true
      t.integer :supplyWebPS, unsigned: true, limit: 2 #promitheia PS=per sale
      t.timestamps
    end
    add_index :web_conts, [:web_feature_id, :continent_id], unique: true
  end
end
