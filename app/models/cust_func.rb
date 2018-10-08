class CustFunc < ApplicationRecord
  belongs_to :function
  belongs_to :customer

  has_many :cust_g_funcs
  has_many :cust_q_funcs

  validates :function, uniqueness: {scope: :customer}, presence: true
end
