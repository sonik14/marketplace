class Game < ApplicationRecord
  belongs_to :version
  belongs_to :first_month, class_name: 'Month'

  has_many :quarters
  has_many :function_gs
  has_many :cust_gs
  has_many :cust_g_funcs
  has_many :companies
  has_many :chat_gs

  validates :name, uniqueness: {scope: :version}, presence: true
  validates :starting_year, numericality: {greater_than: 1990, less_than_or_equal_to: Time.current.year, only_integer: true}
  validates :duration, numericality: true, allow_nil: true
  validates :trainExtraAvail, numericality: true, allow_nil: true
  validates :illPer, numericality: true, allow_nil: true
  validates :current_quarter, numericality: true, allow_nil: true

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
      if q.nil?
        self.current_quarter =  0
      elsif q.q_no < self.duration
        self.current_quarter =  q.q_no
      end
    end

  before_save :game_save

  private
    def game_save
      version = Version.find(self.version_id)
      if self.duration.nil?
        self.duration = version.durationDef
      elsif self.duration > version.durationMax
        self.duration = version.durationMax
      elsif self.duration < version.durationMin
        self.duration = version.durationMin
      end
      if self.trainExtraAvail.nil?
        self.trainExtraAvail = self.duration + 1
      elsif self.trainExtraAvail > version.durationMax
        self.trainExtraAvail = version.durationMax
      elsif self.trainExtraAvail < 1
        self.trainExtraAvail = 1
      end
      version.illPerRmin = (version.illPerRmin*100).round(0)
      version.illPerRmax = (version.illPerRmax*100).round(0)
      if self.illPer.nil?
        self.illPer = rand(version.illPerRmin..version.illPerRmax)
      elsif self.illPer > version.illPerRmax
        self.illPer = version.illPerRmax
      elsif self.illPer < version.illPerRmin
        self.illPer = version.illPerRmin
      end
    end
end
