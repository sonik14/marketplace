class CompQEduc < ApplicationRecord
  belongs_to :education
  belongs_to :comp_q

  validates :education, uniqueness: {scope: :comp_q}, presence: true
end
