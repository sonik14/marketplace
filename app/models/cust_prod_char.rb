class CustProdChar < ApplicationRecord
  belongs_to :prod_char
  belongs_to :customer
end
