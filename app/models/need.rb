class Need < ApplicationRecord
  belongs_to :need_type

  has_many :need_scores

  has_many :need_custs
#  has_many :customers, through: :need_custs

  has_many :need_prod_chars
#  has_many :customers, through: :need_prod_chars

  validates :name, uniqueness: {scope: :neet_type}, presence: true
end
