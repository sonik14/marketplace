class CustProdChar < ApplicationRecord
  belongs_to :prod_char
  belongs_to :customer

  validates :prod_char, uniqueness: {scope: :customer}, presence: true
end
