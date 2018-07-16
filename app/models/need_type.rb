class NeedType < ApplicationRecord
  belongs_to :version

  has_many :needs
end
