class Project < ApplicationRecord
  include ActiveModel::Validations

  has_many :comments, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :users, through: :tasks
  has_many :tickets
  has_one :project_manager

  validates_presence_of :title, :description
  validates :tasks, project_has_one_task: true
end
