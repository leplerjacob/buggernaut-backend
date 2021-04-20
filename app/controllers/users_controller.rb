class UsersController < ApplicationController
  include CurrentUserConcern

  def users_by_project
    project = @current_user.projects.order(:date_start).first
    if !project
      task = Task.where(assigned_to: @current_user.id).last
      project = task.project
    end
    users = project.assigned_to
    render json: { users: users, status: 200 } if users
  end
end
