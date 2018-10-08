class CreateNeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :needs do |t|

      t.belongs_to :need_type, foreign_key: true, index: true, null: false

      t.string :name, index: true, null: false
      t.timestamps
    end
    add_index :needs, [:need_type_id, :name], unique: true
  end
end
