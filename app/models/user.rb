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
end
