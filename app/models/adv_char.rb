class AdvChar < ApplicationRecord
  belongs_to :function
  belongs_to :category_adv
  belongs_to :prod_char

  has_many :cust_adv_chars

  has_many :comp_adv_chars
end
