class CompProdAdv < ApplicationRecord
  belongs_to :comp_prod, optional: true
  belongs_to :comp_adv

  validates :comp_prod, uniqueness: {scope: :comp_adv}
end
