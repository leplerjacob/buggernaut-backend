class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email, :username, :role, :first_name, :last_name
  validates_uniqueness_of :email, :username

  has_many :tasks
  has_many :projects, through: :tasks
end
