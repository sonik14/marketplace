class CategoryProd < ApplicationRecord
  belongs_to :version

  has_many :prod_chars
  has_many :cust_category_prods
end
