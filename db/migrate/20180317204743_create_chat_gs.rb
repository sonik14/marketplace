class CreateChatGs < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_gs do |t|

      t.belongs_to :game, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
end
