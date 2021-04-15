class Ticket < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  belongs_to :claimed_by, class_name: 'User', optional: true
  belongs_to :task, optional: true
  belongs_to :project
end
