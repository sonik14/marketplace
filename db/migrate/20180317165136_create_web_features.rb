class CreateWebFeatures < ActiveRecord::Migration[5.0]
  def change
    create_table :web_features do |t|

      t.belongs_to :version, foreign_key: true, null: false
#      t.belongs_to :function, foreign_key: true

      t.string :name, null: false
      t.timestamps
    end
    add_index :web_features, [:version_id, :name], unique: true
  end
end
