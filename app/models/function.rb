class Function < ApplicationRecord
  belongs_to :version
  belongs_to :function_usage

  has_many :cust_funcs
  has_many :function_gs
  has_many :function_qs

  has_many :scores
  has_many :adv_chars
  has_many :interests
  has_many :fin_line_items
  has_many :transfer_costs

  validates :name, presence: true
  validates :function, presence: true
  #    validates_precision :parAmin, { :precision => 20, :scale => 2 }
end
