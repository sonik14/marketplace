class CompProdChar < ApplicationRecord
  belongs_to :comp_q
  belongs_to :prod_char

  validates :prod_char, uniqueness: {scope: :comp_q}, presence: true
end