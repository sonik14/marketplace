class FinancialStatement < ApplicationRecord
  belongs_to :version

  has_many :fin_line_items
end
