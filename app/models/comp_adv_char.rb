class CompAdvChar < ApplicationRecord
  belongs_to :comp_adv
  belongs_to :adv_char

  validates :adv_char, uniqueness: {scope: :comp_adv}, presence: true
  validates :Seq, uniqueness: {scope: :comp_adv}, presence: true
end
