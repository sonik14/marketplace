class NeedType < ApplicationRecord
  belongs_to :version

  has_many :needs

  validates :name, uniqueness: {scope: :version}, presence: true
end
