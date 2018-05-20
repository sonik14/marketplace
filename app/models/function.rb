class Function < ApplicationRecord
  belongs_to :version

  has_many :changeovers, class_name: 'Game', foreign_key: 'func_changeover_id'
  has_many :scores
  has_many :discounts, class_name: 'ProdChar', foreign_key: 'discount_id'
  has_many :adv_chars

  has_many :prices, class_name: 'Customer', foreign_key: 'func_price_id'
  has_many :adv_appearances_cities, class_name: 'Customer', foreign_key: 'a_appear_city_id'
  has_many :adv_appearances_media, class_name: 'Customer', foreign_key: 'a_appear_media_id'

  has_many :cust_funcs
  has_many :interests
  has_many :demands, class_name: 'Quarter', foreign_key: 'func_demand_id'
  has_many :fin_line_items
  has_many :transfer_costs
end
