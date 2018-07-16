class NeedCust < ApplicationRecord
  belongs_to :need
  belongs_to :customer
end
