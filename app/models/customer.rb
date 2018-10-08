class Customer < ApplicationRecord
  belongs_to :version

  has_many :cust_funcs
  has_many :cust_cities
  has_many :cust_category_prods
  has_many :cust_prod_chars
#  has_many :cust_category_advs
  has_many :cust_adv_chars
  has_many :cust_adv_media
  has_many :need_custs
  has_many :cust_gs
  has_many :cust_g_funcs
  has_many :cust_q_funcs
  has_many :comp_q_priors
  has_many :comp_q_store_custs
  has_many :comp_prod_adv_custs
  has_many :comp_prod_custs

  validates :name, uniqueness: {scope: :version}, presence: true
end
