class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role

  has_many :ceos, class_name: 'Company', foreign_key: 'ceo_id'
  has_many :comp_users
  has_many :chat_lines

#  has_many :chat_users

  validates :role, presence: true
  validates :username, presence: false, allow_nil: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true, length: { minimum: 2 }

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  validates :sign_in_count, presence: true

  before_save :add_user_name

  private
    def add_user_name
      self.name =  self.email + ' <' + self.last_name + ' ' + self.first_name + '>'
    end
end
