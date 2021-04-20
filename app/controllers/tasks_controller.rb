class TasksController < ApplicationController
  include CurrentUserConcern

  # Create validator for requiring task belongs to an open project

  def tasks_for_project
    # Get latest project user is involved in
    project = @current_user.projects.order(:date_start).first
    if !project
      task = Task.where(assigned_to: @current_user.id).last
      project = task.project
    end
    tasks = project.tasks
    render json: { tasks: tasks, status: 200 } if tasks
  end

  def create
    project = Project.find(params['project']['id'])

    if project
      task =
        Task.new(
          user_id: params['task']['user_id'],
          title: params['task']['title'],
          description: params['task']['description'],
          assigned_to_id: params['task']['assigned_to_id']
        )

      project.tasks << task
    end
  end

  def update
    task = Task.find(params[:id])
    if task
      task.update(
        title: params['task']['title'],
        description: params['task']['description'],
        completed: params['task']['completed'],
        assigned_to_id: params['task']['assigned_to_id']
      )
    end
  end

  def dev_update_status
    task = Task.find(params[:id])

    task.update(completed: params['task']['completed']) if task
  end
end
