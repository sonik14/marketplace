class AdvMedium < ApplicationRecord
  belongs_to :version

  has_many :cust_adv_media

  has_many :comp_adv_q_media
end
