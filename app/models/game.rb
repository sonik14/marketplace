class Game < ApplicationRecord
  belongs_to :version
  belongs_to :first_month, class_name: 'Month'

  has_many :cust_g_funcs
  has_many :quarters
  has_many :cust_g_funcs
  has_many :cust_gs
  has_many :chat_gs
  has_many :companies

  before_create :init_quarter

  private
    def init_quarter
      if self.starting_year.nil?
      	self.starting_year = Time.current.year
      end
      self.current_quarter =  0
    end

  before_update :update_quarter

  private
    def update_quarter
      q = Quarter.where(game_id: self.id).order(q_no: :desc).take
      if q
        if q.q_no < self.duration
          self.current_quarter =  q.q_no
        end
      else
        self.current_quarter =  0
      end
    end

  before_save :duration_game

  private
    def duration_game
      version = Version.find(self.version_id)
      if self.duration.nil?
        self.duration = version.durationDef
      elsif self.duration > version.durationMax
        self.duration = version.durationMax
      elsif self.duration < version.durationMin
        self.duration = version.durationMin
      end
    end
end
