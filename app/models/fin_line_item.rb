class FinLineItem < ApplicationRecord
  belongs_to :financial_statement
  belongs_to :function, optional: true

  has_many :comp_q_fins

  validates :name, uniqueness: {scope: :financial_statement}, presence: true
end
