class FunctionUsage < ApplicationRecord
  belongs_to :version

  has_many :functions
end
