class CompAdv < ApplicationRecord
  belongs_to :comp_q
  belongs_to :q_end, class_name: 'Quarter', optional: true

  has_many :comp_adv_chars
  has_many :comp_adv_qs
  has_many :comp_prod_advs
  has_many :comp_prod_adv_custs

  validates :name, uniqueness: {scope: :comp_q}, presence: true
end
