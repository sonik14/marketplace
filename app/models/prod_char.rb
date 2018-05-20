class ProdChar < ApplicationRecord
  belongs_to :category_prod
  belongs_to :discount, class_name: 'Function'

  has_many :need_prod_chars
  has_many :adv_chars
  has_many :cust_prod_chars
  has_many :comp_prod_chars
  has_many :comp_rnds, class_name: 'CompRnd', foreign_key: 'prod_id'
end
