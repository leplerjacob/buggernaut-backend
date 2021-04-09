class ProjectsManagers < ApplicationRecord

    belongs_to :user
    belongs_to :project

    include ActiveModel::Validations
    validates :user_id, is_pm: true
    validates_presence_of :project_id
end