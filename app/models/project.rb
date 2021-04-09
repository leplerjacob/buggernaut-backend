class Project < ApplicationRecord

    validates_presence_of :title, :description

    has_many :tasks
    has_one :user, through: :tasks
end
