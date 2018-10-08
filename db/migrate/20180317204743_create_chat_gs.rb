class CreateChatGs < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_gs do |t|

      t.belongs_to :game, foreign_key: true, null: false, index: true
      t.integer :name1_id, null: false
      t.integer :name2_id, null: false

      t.timestamps
    end
    add_foreign_key :chat_gs, :companies, column: :name1_id
    add_foreign_key :chat_gs, :companies, column: :name2_id
    add_index :chat_gs, [:game_id, :name1_id, :name2_id], unique: true
  end
end
