class CompRnd < ApplicationRecord
  belongs_to :quarter
  belongs_to :quarter_o, class_name: 'Quarter'
  belongs_to :prod, class_name: 'ProdChar'
  belongs_to :seller, class_name: 'Company'
  belongs_to :buyer, class_name: 'Company'
end
