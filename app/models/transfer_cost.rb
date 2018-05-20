class TransferCost < ApplicationRecord
  belongs_to :function
  belongs_to :name1, class_name: 'Continent'
  belongs_to :name2, class_name: 'Continent'
end
