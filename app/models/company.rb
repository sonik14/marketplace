class Company < ApplicationRecord
  belongs_to :continent
  belongs_to :game
  belongs_to :ceo, class_name: 'User'

  has_many :comp_users
  has_many :sellers, class_name: 'CompRnd', foreign_key: 'seller_id'
  has_many :buyers, class_name: 'CompRnd', foreign_key: 'buyer_id'
  has_many :comp_qs
  has_many :comp_goals
end
