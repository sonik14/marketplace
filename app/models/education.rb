class Education < ApplicationRecord
  belongs_to :version

  has_many :comp_q_educs
end
