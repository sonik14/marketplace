class Quarter < ApplicationRecord
  belongs_to :game

  has_many :comp_adv_qs
  has_many :comp_rnds
  has_many :obtainedRnds, class_name: 'CompRnd', foreign_key: 'quarter_o_id'
  has_many :comp_advs, class_name: 'CompAdv', foreign_key: 'q_end_id'
  has_many :comp_prods, class_name: 'CompProd', foreign_key: 'q_end_id'
  has_many :comp_prod_qs
  has_many :mqs
  has_many :comp_qs
end
