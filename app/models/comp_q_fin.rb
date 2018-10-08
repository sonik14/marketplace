class CompQFin < ApplicationRecord
  belongs_to :comp_q
  belongs_to :fin_line_item

  validates :fin_line_item, uniqueness: {scope: :comp_q}, presence: true
end
