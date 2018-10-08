class CompAdvQMedium < ApplicationRecord
  belongs_to :comp_adv_q
  belongs_to :adv_medium

  validates :adv_medium, uniqueness: {scope: :comp_adv_q}, presence: true
end