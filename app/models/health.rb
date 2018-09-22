class Health < ApplicationRecord
  belongs_to :version

  has_many :health_conts

  has_many :employees, class_name: 'Continent', foreign_key: 'health_e_id'
  has_many :workers, class_name: 'Continent', foreign_key: 'health_w_id'

  has_many :insurance_employees, class_name: 'CompQ', foreign_key: 'insurance_e_id'
  has_many :insurance_workers, class_name: 'CompQ', foreign_key: 'insurance_w_id'

  validates :version, presence: true
  validates :name, presence: true, uniqueness: true
#  validates :default, uniqueness: true, if: :default
end
