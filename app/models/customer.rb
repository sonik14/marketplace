class Customer < ApplicationRecord
  belongs_to :version
  belongs_to :func_price, class_name: 'Function'
  belongs_to :a_appear_city, class_name: 'Function'
  belongs_to :a_appear_media, class_name: 'Function'

  has_many :cust_category_prods
  has_many :need_custs
  has_many :cust_prod_chars
  has_many :cust_adv_chars
  has_many :cust_category_advs
  has_many :cust_adv_media
  has_many :comp_prod_adv_custs
  has_many :comp_prod_custs
  has_many :comp_q_store_custs
  has_many :cust_funcs
  has_many :comp_q_priors
  has_many :cust_gs
  has_many :cust_cities
end
