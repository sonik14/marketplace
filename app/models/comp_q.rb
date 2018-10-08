class CompQ < ApplicationRecord
  belongs_to :quarter
  belongs_to :company
  belongs_to :insurance_e, class_name: 'Health', optional: true
  belongs_to :insurance_w, class_name: 'Health', optional: true

  has_many :comp_q_priors
  has_many :comp_q_searches
  has_many :comp_q_educs
  has_many :comp_prods
  has_many :comp_prod_chars
  has_many :comp_advs
  has_many :comp_q_stores
  has_many :comp_q_webs
  has_many :comp_q_loans
  has_many :comp_q_fins
  has_many :comp_q_scores

  validates :company, uniqueness: {scope: :quarter}, presence: true
  validates :fundingPer, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100, only_integer: true}, allow_nil: false
end
