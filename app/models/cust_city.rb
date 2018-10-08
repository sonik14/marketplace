class CustCity < ApplicationRecord
  belongs_to :city
  belongs_to :customer

  has_many :cust_g_mq_cities
  has_many :comp_q_cust_cities

  validates :city, uniqueness: {scope: :customer}, presence: true

  before_save :cust_city_name

  private
    def cust_city_name
      cust = Customer.find(self.customer_id).name
      city = City.find(self.city_id).name
      self.name = "Customer: " + cust + ", City: " + city
    end
end
