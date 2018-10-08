class ChatG < ApplicationRecord
  belongs_to :game
  belongs_to :name1, class_name: 'Company'
  belongs_to :name2, class_name: 'Company'

  has_many :chat_lines
#  has_many :chat_users

  validates :game, uniqueness: {scope: [:name1, :name2]}, presence: true
end
