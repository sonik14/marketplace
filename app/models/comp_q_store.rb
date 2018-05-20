class CompQStore < ApplicationRecord
  belongs_to :city
  belongs_to :comp_q

  has_many :comp_q_store_custs
  has_many :comp_prod_q_stores
end
