class CompProdQCust < ApplicationRecord
	belongs_to :comp_prod
	belongs_to :quarter
	belongs_to :customer

  	validates :quarter, uniqueness: {scope: [:customer, :comp_prod]}, presence: true
end
