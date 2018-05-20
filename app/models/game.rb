class Game < ApplicationRecord
  belongs_to :version
  belongs_to :month
  belongs_to :func_changeover, class_name: 'Function'

  has_many :cust_g_funcs
  has_many :quarters
  has_many :cust_g_funcs
  has_many :cust_gs
  has_many :chat_gs
  has_many :companies
end
