class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :task, optional: true
  belongs_to :ticket, optional: true
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :replies,
           class_name: 'Comment',
           foreign_key: :parent_id,
           dependent: :destroy
end
