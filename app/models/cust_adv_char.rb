class CustAdvChar < ApplicationRecord
  belongs_to :adv_char
  belongs_to :customer

  validates :adv_char, uniqueness: {scope: :customer}, presence: true
end
