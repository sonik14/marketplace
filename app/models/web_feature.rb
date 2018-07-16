class WebFeature < ApplicationRecord
  belongs_to :version

  has_many :web_supplies
end
