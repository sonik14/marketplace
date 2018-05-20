class ChatG < ApplicationRecord
  belongs_to :game

  has_many :chat_lines
  has_many :chat_users
end
