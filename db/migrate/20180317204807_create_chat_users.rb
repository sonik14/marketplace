class CreateChatUsers < ActiveRecord::Migration[5.0]
# depreciated, chat only between companies. left in case you want personal chats
=begin
  def change
    create_table :chat_users do |t|

      t.belongs_to :chat_g, foreign_key: true, null: false, index: true
      t.belongs_to :user, foreign_key: true, null: false, index: true, on_delete: :restrict

      t.timestamps
    end
    add_index :chat_users, [:chat_g_id, :user_id], unique: true
  end
=end
end
