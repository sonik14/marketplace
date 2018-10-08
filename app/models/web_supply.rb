class WebSupply < ApplicationRecord
  belongs_to :web_feature
  belongs_to :continent

  has_many :comp_q_web_supplies

  validates :web_feature, uniqueness: {scope: :continent}, presence: true
end
