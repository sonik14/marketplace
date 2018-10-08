class CreateWebSupplies < ActiveRecord::Migration[5.0]
  def change
    create_table :web_supplies do |t|

      t.belongs_to :web_feature, foreign_key: true, null: false
      t.belongs_to :continent, foreign_key: true, null: false

      t.string :name
      t.integer :initC, unsigned: true
      t.integer :supplyWebPS, unsigned: true, limit: 2 #promitheia PS=per sale
      t.timestamps
    end
    add_index :web_supplies, [:web_feature_id, :continent_id], unique: true
  end
end
