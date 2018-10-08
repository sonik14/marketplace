class WebFeature < ApplicationRecord
  belongs_to :version

  has_many :web_supplies

  validates :name, uniqueness: {scope: :version}, presence: true
end
