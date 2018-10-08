class CompQCustCity < ApplicationRecord
  belongs_to :cust_city
  belongs_to :company
  belongs_to :quarter, optional: true

  has_many :comp_prod_q_cust_cities

  validates :quarter, uniqueness: {scope: [:company, :cust_city]}
  validates :q_no, uniqueness: {scope: [:company, :cust_city]}
end
