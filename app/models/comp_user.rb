class CompUser < ApplicationRecord
  belongs_to :company
  belongs_to :user

  validates :user, uniqueness: {scope: :company}, presence: true
end
