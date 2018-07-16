class CompProdCust < ApplicationRecord
  belongs_to :comp_prod
  belongs_to :customer
end
