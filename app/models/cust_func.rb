class CustFunc < ApplicationRecord
  belongs_to :function
  belongs_to :customer

  has_many :cust_g_funcs
end
