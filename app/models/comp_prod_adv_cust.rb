class CompProdAdvCust < ApplicationRecord
  belongs_to :comp_prod, optional: true
  belongs_to :comp_adv
  belongs_to :customer

  validates :comp_adv, uniqueness: {scope: [:customer, :comp_prod]}, presence: true
end
