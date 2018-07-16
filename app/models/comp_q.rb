class CompQ < ApplicationRecord
  belongs_to :quarter
  belongs_to :company
  belongs_to :insurance_e, class_name: 'Health'
  belongs_to :insurance_w, class_name: 'Health'

  has_many :comp_prod_chars
  has_many :comp_q_scores
  has_many :comp_q_priors
  has_many :comp_advs
  has_many :comp_prods
  has_many :comp_q_loans
  has_many :comp_q_cust_cities
  has_many :comp_q_fins
  has_many :comp_q_stores
  has_many :comp_q_webs
  has_many :comp_q_searches
  has_many :comp_q_educs
end
