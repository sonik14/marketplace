class CompProdQWeb < ApplicationRecord
  belongs_to :comp_prod_q
  belongs_to :comp_q_web

  validates :comp_prod_q, uniqueness: {scope: :comp_q_web}, presence: true
  validates :Seq, uniqueness: {scope: :comp_q_web}, presence: true
end
