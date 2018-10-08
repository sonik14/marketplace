class Interest < ApplicationRecord
  belongs_to :version
  belongs_to :function, optional: true

  has_many :loans

  validates :name, uniqueness: {scope: :version}, presence: true
end
