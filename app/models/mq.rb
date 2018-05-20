class Mq < ApplicationRecord
  belongs_to :month
  belongs_to :quarter

  has_many :comp_prod_mq_cust_cities
  has_many :cust_g_mq_cities
end
