class City < ApplicationRecord
  belongs_to :continent

  has_many :comp_q_stores

  has_many :cust_cities
  has_many :customers, through: :cust_cities

  has_many :comp_prod_q_cities
  has_many :comp_prod_qs, through: :comp_prod_q_cities

  has_many :comp_adv_q_cities
  has_many :comp_adv_qs, through: :comp_adv_q_cities
end