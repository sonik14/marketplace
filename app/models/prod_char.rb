class ProdChar < ApplicationRecord
  belongs_to :category_prod

  has_many :adv_chars
  has_many :cust_prod_chars
  has_many :need_prod_chars
  has_many :comp_rnds, class_name: 'CompRnd', foreign_key: 'prod_id'
  has_many :comp_prod_chars

  validates :name, uniqueness: {scope: :category_prod}, presence: true
  validates :scale, uniqueness: {scope: :category_prod}
end
