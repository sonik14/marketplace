class CompProdQ < ApplicationRecord
  belongs_to :comp_prod
  belongs_to :quarter

  has_many :comp_prod_q_stores
  has_many :comp_prod_q_webs
  has_many :comp_prod_q_cities
end
