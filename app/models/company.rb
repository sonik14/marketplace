class Company < ApplicationRecord
  belongs_to :continent, optional: true # auto assign is nil, thus belongs to must be set to optional
  belongs_to :game
  belongs_to :ceo, class_name: 'User'

  has_many :comp_users
  has_many :sellers, class_name: 'CompRnd', foreign_key: 'seller_id'
  has_many :buyers, class_name: 'CompRnd', foreign_key: 'buyer_id'
  has_many :comp_qs
  has_many :comp_goals

  validates :continent, presence: false, allow_nil: true
  validates :ceo, uniqueness: {scope: :game}
=begin
  before_create :check_continent

  private
  def check_continent
    self.continent_id = nil
  end
=end
end
