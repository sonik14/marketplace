class FactoryCapacity < ApplicationRecord
  belongs_to :version

  validates :capacity, uniqueness: {scope: :version}, presence: true
end
