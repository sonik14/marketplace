class NeedProdChar < ApplicationRecord
  belongs_to :need
  belongs_to :prod_char

  validates :prod_char, uniqueness: {scope: :need}, presence: true
end
