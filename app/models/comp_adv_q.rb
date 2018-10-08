class CompAdvQ < ApplicationRecord
  belongs_to :comp_adv
  belongs_to :quarter

  has_many :comp_adv_q_media
  has_many :comp_adv_q_cities

  validates :quarter, uniqueness: {scope: :comp_adv}, presence: true
end
