class Goal < ApplicationRecord
  belongs_to :version

  has_many :comp_goals
end
