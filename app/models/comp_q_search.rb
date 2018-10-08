class CompQSearch < ApplicationRecord
  belongs_to :continent
  belongs_to :comp_q

  validates :continent, uniqueness: {scope: :comp_q}, presence: true
end
