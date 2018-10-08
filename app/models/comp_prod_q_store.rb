class CompProdQStore < ApplicationRecord
  belongs_to :comp_prod_q
  belongs_to :comp_q_store

  validates :comp_prod_q, uniqueness: {scope: :comp_q_store}, presence: true
end
