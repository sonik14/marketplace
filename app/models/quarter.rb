class Quarter < ApplicationRecord
  belongs_to :game

  has_many :mqs
  has_many :function_qs
  has_many :cust_q_funcs
  has_many :comp_rnds
  has_many :comp_qs
  has_many :comp_prods, class_name: 'CompProd', foreign_key: 'q_end_id'
  has_many :comp_prod_qs
  has_many :comp_advs, class_name: 'CompAdv', foreign_key: 'q_end_id'
  has_many :comp_adv_qs
  has_many :comp_q_cust_cities

  validates :q_no, uniqueness: {scope: :game}, presence: true
  validates :rangeDemandPer, numericality: true, allow_nil: true
  validates :fundingAmountMax, numericality: true, allow_nil: true

#  has_many :obtainedRnds, class_name: 'CompRnd', foreign_key: 'quarter_o_id'

  before_save :quarter_save

  private
    def quarter_save
      self.name = "Quarter: " + self.q_no.to_s + " of Game: " + Game.select(:name).where(id: self.game_id).take.name
      version = Version.find(Game.select(:version_id).find(self.game_id).version_id)
      min = version.rangeDemandMin*100.round(0)
      max = version.rangeDemandMax*100.round(0)
      if self.rangeDemandPer.nil?
        self.rangeDemandPer = rand(min..max)
      elsif self.rangeDemandPer > max
        self.rangeDemandPer = max
      elsif self.rangeDemandPer < min
        self.rangeDemandPer = min
      end
      if self.fundingAmountMax.nil?
        self.fundingAmountMax = version.funding_amount_default
      end
    end
end
