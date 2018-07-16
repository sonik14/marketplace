class CompQCustCity < ApplicationRecord
  belongs_to :cust_city
  belongs_to :comp_q

  has_many :comp_prod_q_cust_cities
end
