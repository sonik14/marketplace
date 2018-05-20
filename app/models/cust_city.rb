class CustCity < ApplicationRecord
  belongs_to :city
  belongs_to :customer

  has_many :cust_g_mq_cities
  has_many :comp_q_cust_cities
end
