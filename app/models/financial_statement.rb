class FinancialStatement < ApplicationRecord
  belongs_to :version

  has_many :fin_line_items

  validates :name, uniqueness: {scope: :version}, presence: true
end
