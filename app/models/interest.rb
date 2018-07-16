class Interest < ApplicationRecord
  belongs_to :function

  has_many :loans
end
