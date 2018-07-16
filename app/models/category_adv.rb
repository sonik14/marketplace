class CategoryAdv < ApplicationRecord
  belongs_to :version

  has_many :adv_chars
  has_many :cust_category_advs
end
