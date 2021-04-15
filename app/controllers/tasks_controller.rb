class TasksController < ApplicationController
  # Create validator for requiring task belongs to an open project

  def create
    project = Project.find(params['project']['id'])

    if project
      task =
        Task.new(
            user_id: params["task"]["user_id"],
          title: params['task']['title'],
          description: params['task']['description'],
          assigned_to_id: params['task']['assigned_to_id']
        )
    
      project.tasks << task
    end
  end
end
