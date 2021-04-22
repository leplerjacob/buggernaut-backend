class ProjectsController < ApplicationController
  include CurrentUserConcern

  def index
    projects = Project.all
    render json: projects
  end

  def open_projects_tasks_and_tickets
    if @current_user.role === "Project Manager"
      projects =
        @current_user.project_managers.collect do |pm|
          pm.project if !pm.project.completed
        end
      render json: projects, include: %i[tasks tickets] if projects.count > 0
    else 
      projects = @current_user.projects
      render json: projects, include: %i[tasks tickets] if projects.count > 0
    end
  end

  def create
    project =
      Project.new(
        title: params[:project][:title],
        description: params[:project][:description],
        date_start: params[:startDate],
        date_end: params[:endDate],
        est_duration: params[:estDuration],
        time_spent: '',
        completed: false
      )

    params[:taskInputs].values.each do |task|
      task =
        Task.new(
          title: task['taskTitle'],
          description: task['taskDescription'],
          completed: false,
          user_id: params[:pm_id],
          assigned_to_id: task['taskAssignTo']
        )
      project.tasks << task
    end

    project.save
    render json: { project: project, status: 200 } if project.valid?
  end

  def show
    project = Project.find(params[:id])
    render json: project, include: %i[users project_manager]
  end

  def users_projects
    users = User.where.not(id: @current_user.id)
    projects = @current_user.projects.uniq
    render json: { status: 200, projects: projects, users: users } if projects
  end

  def current_tasks_and_tickets
    tasks = Task.where(assigned_to: @current_user.id)
    tickets = Ticket.where(claimed_by: @current_user.id)
    if tasks.empty? && tickets.empty?

    else

    end

    render json: { tasks: tasks, tickets: tickets }
  end
end
