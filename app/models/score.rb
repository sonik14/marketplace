class Score < ApplicationRecord
  belongs_to :version
  belongs_to :function

  has_many :comp_q_scores
  has_many :need_scores
end
