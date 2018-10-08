class CustGMqCity < ApplicationRecord
  belongs_to :cust_city
  belongs_to :mq

  validates :mq, uniqueness: {scope: :cust_city}, presence: true
end
