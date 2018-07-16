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
  has_many :health_e_ids, through: :continents, source: :health_e
  has_many :health_w_ids, through: :continents, source: :health_w

  has_many :customers
  has_many :func_price_ids, through: :customers, source: :func_price
  has_many :a_appear_city_ids, through: :customers, source: :a_appear_city
  has_many :a_appear_media_ids, through: :customers, source: :a_appear_media

  has_many :games
  has_many :func_changeover_ids, through: :games, source: :func_changeover

  has_many :scores
  has_many :functions, through: :scores
  validates :illPerRmin, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 1}

  validates :mainNo, presence: true, numericality: {greater_than: 0, only_integer: true}
  validates :name, presence: true, uniqueness: true
end
