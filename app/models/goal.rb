class Goal < ApplicationRecord
  belongs_to :version

  has_many :comp_goals

  validates :name, uniqueness: {scope: :version}, presence: true
end
