class UsersController < ApplicationController
  include CurrentUserConcern

  def users_by_project
    if @current_user.role === "Project Manager"
      project = @current_user.project_managers.collect {|pm|
        pm.project if !pm.project.completed
      }.sort {|a,b|
        a.date_start < b.date_start ? 0 : 1
      }.first
    else
      project = @current_user.projects.order(:date_start).first
    end
    if !project
      task = Task.where(assigned_to: @current_user.id).last
      project = task.project
    end
    users = project.assigned_to
    render json: { users: users, status: 200 } if users
  end
end
