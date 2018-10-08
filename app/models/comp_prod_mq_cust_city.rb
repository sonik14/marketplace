class CompProdMqCustCity < ApplicationRecord
  belongs_to :mq
  belongs_to :comp_prod_q_cust_city

  validates :mq, uniqueness: {scope: :comp_prod_q_cust_city}, presence: true
end
