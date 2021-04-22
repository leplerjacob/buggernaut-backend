class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email, :username, :role, :first_name, :last_name
  validates_uniqueness_of :email, :username

  has_many :tasks, foreign_key: 'assigned_to_id'

  # has_many :tasks, foreign_key: 'user_id'
  has_many :projects, through: :tasks
  has_many :project_managers
end
