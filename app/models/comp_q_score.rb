class CompQScore < ApplicationRecord
  belongs_to :comp_q
  belongs_to :score

  validates :score, uniqueness: {scope: :comp_q}, presence: true
end
