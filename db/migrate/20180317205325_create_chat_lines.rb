class CreateChatLines < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_lines do |t|

      t.belongs_to :chat_g, foreign_key: true, null: false, index: true

	  t.text :text, null: false
      t.timestamps
    end
  end
end
