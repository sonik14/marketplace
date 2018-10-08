class NeedCust < ApplicationRecord
  belongs_to :need
  belongs_to :customer

  validates :customer, uniqueness: {scope: :need}, presence: true
end
