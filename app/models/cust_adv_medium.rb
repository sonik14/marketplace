class CustAdvMedium < ApplicationRecord
  belongs_to :adv_medium
  belongs_to :customer

  validates :adv_medium, uniqueness: {scope: :customer}, presence: true
end
