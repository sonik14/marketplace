class CompProd < ApplicationRecord
  belongs_to :comp_q
  belongs_to :q_end, class_name: 'Quarter'

  has_many :comp_prod_custs
  has_many :comp_prod_adv_custs
  has_many :comp_prod_qs
  has_many :comp_prod_advs
end
