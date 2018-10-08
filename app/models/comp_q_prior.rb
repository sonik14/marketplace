class CompQPrior < ApplicationRecord
  belongs_to :comp_q
  belongs_to :customer

  validates :Seq, uniqueness: {scope: :comp_q}, presence: true
end
