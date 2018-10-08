class CompProd < ApplicationRecord
  belongs_to :comp_q
  belongs_to :q_end, class_name: 'Quarter', optional: true

  has_many :comp_prod_qs
  has_many :comp_prod_advs
  has_many :comp_prod_q_cust_cities
  has_many :comp_prod_adv_custs
  has_many :comp_prod_custs

  validates :name, uniqueness: {scope: :comp_q}, presence: true
end
