class CreateAdvMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :adv_media do |t|

      t.belongs_to :version, foreign_key: true, null: false

      t.string :name, index: true, null: false
      t.integer :cost, unsigned: true
      t.timestamps
    end
    add_index :adv_media, [:version_id, :name], unique: true
  end
end
