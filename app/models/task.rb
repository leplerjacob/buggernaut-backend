class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :tickets
  belongs_to :assigned_to, class_name: 'User', optional: true
end
