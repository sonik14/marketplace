class CreateChatGs < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_gs do |t|

      t.timestamps
    end
  end
end
