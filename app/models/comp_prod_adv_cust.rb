class CompProdAdvCust < ApplicationRecord
  belongs_to :comp_prod
  belongs_to :comp_adv
  belongs_to :customer
end
