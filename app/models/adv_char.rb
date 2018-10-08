class AdvChar < ApplicationRecord
  belongs_to :category_adv
  belongs_to :function, optional: true
  belongs_to :prod_char, optional: true

  has_many :cust_adv_chars
  #has_many :customers, through: :cust_adv_chars

  has_many :comp_adv_chars
  #has_many :comp_advs, through: :comp_adv_chars

  validates :name, uniqueness: {scope: :category_adv}, presence: true
  validates :scale, uniqueness: {scope: :category_adv}
end
