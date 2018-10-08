class Month < ApplicationRecord
  belongs_to :version

  has_many :games
  has_many :mqs

  validates :name, uniqueness: true, presence: true
  validates :noDays, presence: true
  validates :no, uniqueness: {scope: :version}, presence: true
end
