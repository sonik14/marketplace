class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role

  has_many :companies
  has_many :comp_users
  has_many :ceos, class_name: 'CompUser', foreign_key: 'ceo_id'
  has_many :chat_users

  validates :role, presence: true
  validates :username, presence: false, allow_nil: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true, length: { minimum: 2 }

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  validates :sign_in_count, presence: true
end
