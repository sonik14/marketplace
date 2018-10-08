class CustCategoryProd < ApplicationRecord
  belongs_to :category_prod
  belongs_to :customer

  validates :category_prod, uniqueness: {scope: :customer}, presence: true
end
