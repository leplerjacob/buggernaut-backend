class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :project
    belongs_to :task, optional: true
    belongs_to :ticket, optional: true

    
end
