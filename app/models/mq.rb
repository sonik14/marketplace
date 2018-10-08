class Mq < ApplicationRecord
  belongs_to :month
  belongs_to :quarter

  has_many :cust_g_mq_cities
  has_many :comp_prod_mq_cust_cities

  validates :quarter, uniqueness: {scope: :month}, presence: true

  before_save :mq_name

  private
    def mq_name
      month = Month.find(self.month_id).name
      quarter = Quarter.find(self.quarter_id).name
      self.name = "Month: " + month + " during " + quarter
    end
end

