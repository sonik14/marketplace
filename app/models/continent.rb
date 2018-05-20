class Continent < ApplicationRecord
  belongs_to :version

  belongs_to :health_e, class_name: 'Health'
  belongs_to :health_w, class_name: 'Health'
  belongs_to :health_e, class_name: 'Health'
  belongs_to :health_w, class_name: 'Health'
  #It overrides the first time for some reason. Look it up.

  has_many :companies
  has_many :transfer_senders, class_name: 'TransferCost', foreign_key: 'name1_id'
  has_many :transfer_receivers, class_name: 'TransferCost', foreign_key: 'name2_id'
  has_many :health_conts
  has_many :cities
  has_many :comp_q_searches
  has_many :comp_q_webs
  has_many :web_conts
end
