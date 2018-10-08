class FunctionUsage < ApplicationRecord
  belongs_to :version

  has_many :functions
  has_many :function_gs
  has_many :function_qs
  has_many :cust_g_funcs
  has_many :cust_q_funcs

  validates :name, uniqueness: {scope: :version}, presence: true
end
