class ChatLine < ApplicationRecord
  belongs_to :chat_g
  belongs_to :user
end
