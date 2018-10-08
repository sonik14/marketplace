class TransferCost < ApplicationRecord
  belongs_to :name1, class_name: 'Continent'
  belongs_to :name2, class_name: 'Continent'
  belongs_to :function, optional: true

  validates :name1, uniqueness: {scope: :name2}, presence: true
end
