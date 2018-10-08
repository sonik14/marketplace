class CompAdvQCity < ApplicationRecord
  belongs_to :comp_adv_q
  belongs_to :city

  validates :city, uniqueness: {scope: :comp_adv_q}, presence: true
end