class Need < ApplicationRecord
  belongs_to :need_type

  has_many :need_scores

  has_many :need_custs

  has_many :need_prod_chars
end
