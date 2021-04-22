class Task < ApplicationRecord
  belongs_to :project
  belongs_to :assigned_to, class_name: 'User', optional: true
  has_many :tickets
end
