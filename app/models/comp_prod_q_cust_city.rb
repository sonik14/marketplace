class CompProdQCustCity < ApplicationRecord
  belongs_to :comp_q_cust_city
  belongs_to :comp_prod

  has_many :comp_prod_mq_cust_cities
end
