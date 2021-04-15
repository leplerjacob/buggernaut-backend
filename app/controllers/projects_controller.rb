class ProjectsController < ApplicationController
  def index
    projects = Project.all
    render json: projects
  end

  def show
    project = Project.find(params[:id])
    render json: project, include: %i[users project_manager]
  end

  def create
    project =
      Project.new(
        title: params[:project][:title],
        description: params[:project][:description],
        date_start: params[:project][:date_start],
        date_end: params[:project][:date_end],
        est_duration: params[:project][:est_duration],
        time_spent: '',
        completed: false
      )

    params[:tasks].each do |task|
      task =
        Task.new(
          title: task['title'],
          description: task['description'],
          completed: false,
          user_id: task['user_id'],
          assigned_to_id: task['assigned_to_id']
        )
      project.tasks << task
    end
    project.save
  end
end
