class Version < ApplicationRecord
  has_many :adv_media
  has_many :category_advs
  has_many :category_prods
  has_many :educations
  has_many :factory_capacities
  has_many :financial_statements
  has_many :functions
  has_many :goals
  has_many :healths
  has_many :months
  has_many :need_types
  has_many :web_features
  
  has_many :continents

  has_many :customers

  has_many :games

  has_many :scores
end
