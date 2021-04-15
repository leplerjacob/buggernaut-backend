class ProjectsManagers < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :user
  belongs_to :project

  validates :user_id, is_pm: true
  validates_presence_of :project_id
end
