class Function < ApplicationRecord
  belongs_to :function_usage

  has_many :adv_chars
  has_many :cust_funcs
  has_many :scores
  has_many :transfer_costs
  has_many :interests
  has_many :fin_line_items
  has_many :function_gs
  has_many :function_qs
  has_many :cust_g_funcs
  has_many :cust_q_funcs

  validates :name, uniqueness: {scope: :function_usage}, presence: true
  validates :function, uniqueness: {scope: :function_usage}, presence: true

  #    validates_precision :parAmin, { :precision => 20, :scale => 2 }
end
