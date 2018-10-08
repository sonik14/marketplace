class Education < ApplicationRecord
  belongs_to :version

  has_many :comp_q_educs

  validates :name, uniqueness: {scope: :version}, presence: true
end
