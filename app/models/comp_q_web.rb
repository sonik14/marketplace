class CompQWeb < ApplicationRecord
  belongs_to :continent
  belongs_to :comp_q

  has_many :comp_prod_q_webs
  has_many :comp_q_web_supplies
end
