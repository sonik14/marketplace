class CompQLoan < ApplicationRecord
  belongs_to :loan
  belongs_to :comp_q

  validates :loan, uniqueness: {scope: :comp_q}, presence: true
end
