class CompProdQCity < ApplicationRecord
  belongs_to :comp_prod_q
  belongs_to :city

  validates :city, uniqueness: {scope: :comp_prod_q}, presence: true
end
