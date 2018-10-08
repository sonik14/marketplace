class HealthCont < ApplicationRecord
  belongs_to :health
  belongs_to :continent

  validates :health, uniqueness: {scope: :continent}, presence: true
end
