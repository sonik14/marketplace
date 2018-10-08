class CompQWebSupply < ApplicationRecord
  belongs_to :comp_q_web
  belongs_to :web_supply

  validates :web_supply, uniqueness: {scope: :comp_q_web}, presence: true
end
