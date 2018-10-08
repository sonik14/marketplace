class Continent < ApplicationRecord
  belongs_to :version
  belongs_to :health_e, class_name: 'Health'
  belongs_to :health_w, class_name: 'Health'
  #If it does not find the association, just repeat it. Look it up.

  has_many :health_conts
  has_many :cities
  has_many :web_supplies
  has_many :transfer_senders, class_name: 'TransferCost', foreign_key: 'name1_id'
  has_many :transfer_receivers, class_name: 'TransferCost', foreign_key: 'name2_id'
  has_many :companies
  has_many :comp_q_searches
  has_many :comp_q_webs

  validates :name, uniqueness: {scope: :version}, presence: true, length: { minimum: 2 }
  #the sequence of name/version counts for the location where the warning for dublication will be.
end
