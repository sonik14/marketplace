class Company < ApplicationRecord
  belongs_to :game
  belongs_to :ceo, class_name: 'User'
  belongs_to :continent, optional: true # auto assign is nil, thus belongs to must be set to optional

  has_many :comp_goals
  has_many :comp_users
  has_many :company1, class_name: 'ChatG', foreign_key: 'name1_id'
  has_many :company2, class_name: 'ChatG', foreign_key: 'name2_id'
  has_many :sellers, class_name: 'CompRnd', foreign_key: 'seller_id'
  has_many :buyers, class_name: 'CompRnd', foreign_key: 'buyer_id'
  has_many :comp_qs
  has_many :comp_q_cust_cities

  validates :name, uniqueness: {scope: :game}, allow_nil: true
  validates :ceo, uniqueness: {scope: :game}, presence: true
=begin
  before_create :check_continent

  private
  def check_continent
    self.continent_id = nil
  end
=end
end
