class CreateNeedTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :need_types do |t|

      t.belongs_to :version, foreign_key: true, null: false

      t.string :name, index: true, null: false
      t.timestamps
    end
    add_index :need_types, [:version_id, :name], unique: true
  end
end
