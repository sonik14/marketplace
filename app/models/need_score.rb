class NeedScore < ApplicationRecord
  belongs_to :need
  belongs_to :score

  validates :score, uniqueness: {scope: :need}, presence: true
end
