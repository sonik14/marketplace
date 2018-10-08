class CompQStoreCust < ApplicationRecord
  belongs_to :comp_q_store
  belongs_to :customer

  validates :customer, uniqueness: {scope: :comp_q_store}, presence: true
end
