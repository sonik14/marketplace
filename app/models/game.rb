class Game < ApplicationRecord
  belongs_to :version
  belongs_to :month

  has_many :cust_g_funcs
  has_many :quarters
  has_many :cust_g_funcs
  has_many :cust_gs
  has_many :chat_gs
  has_many :companies
end
