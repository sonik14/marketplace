class Score < ApplicationRecord
  belongs_to :version
  belongs_to :function, optional: true

  has_many :need_scores
  has_many :comp_q_scores

  validates :name, uniqueness: {scope: :version}, presence: true
end
