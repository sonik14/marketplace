class CompQLoan < ApplicationRecord
  belongs_to :loan
  belongs_to :comp_q
end
