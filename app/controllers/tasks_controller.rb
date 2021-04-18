class TasksController < ApplicationController
  # Create validator for requiring task belongs to an open project

  def tasks_for_project
    project_manager = ProjectManager.find_by(user_id: params[:id])
    project = Project.where(project_manager: project_manager.id).where(completed: false).first
    tasks = project.tasks
    if tasks
      render json: { tasks: tasks, status: 200}
    end
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
    byebug
    if task
        task.update(completed: params["task"]["completed"])
    end
    byebug
  end

end
