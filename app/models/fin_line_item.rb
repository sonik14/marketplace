class FinLineItem < ApplicationRecord
  belongs_to :financial_statement
  belongs_to :function

  has_many :comp_q_fins
end
