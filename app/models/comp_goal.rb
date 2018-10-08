class CompGoal < ApplicationRecord
  belongs_to :company
  belongs_to :goal

  validates :goal, uniqueness: {scope: :company}, presence: true
end