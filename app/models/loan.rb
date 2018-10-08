class Loan < ApplicationRecord
  belongs_to :interest

  has_many :comp_q_loans

  validates :name, uniqueness: {scope: :interest}, presence: true
end
