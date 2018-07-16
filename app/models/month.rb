class Month < ApplicationRecord
  belongs_to :version

  has_many :games
  has_many :mqs
end
