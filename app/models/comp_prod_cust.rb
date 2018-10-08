class CompProdCust < ApplicationRecord
  belongs_to :comp_prod
  belongs_to :customer

  validates :customer, uniqueness: {scope: :comp_prod}, presence: true
end
