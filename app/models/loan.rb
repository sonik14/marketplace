class Loan < ApplicationRecord
  belongs_to :interest

  has_many :comp_q_loans
end
