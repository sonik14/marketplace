class CompRnd < ApplicationRecord
  belongs_to :quarter
#  belongs_to :quarter_o, class_name: 'Quarter'
  belongs_to :prod, class_name: 'ProdChar'
  belongs_to :seller, class_name: 'Company', optional: true
  belongs_to :buyer, class_name: 'Company'

  validates :seller, uniqueness: {scope: [:prod, :quarter_o_no, :cancelled]}
  validates :buyer, uniqueness: {scope: [:prod, :cancelled]}, presence: true
  validates :prod, uniqueness: {scope: [:seller, :buyer, :cancelled]}, presence: true
  validates :cancelled, uniqueness: {scope: [:seller, :buyer, :signedS, :signedB]}, presence: true
end
