class UsersController < ApplicationController

    def users_by_project
        project_manager = ProjectManager.find_by(user_id: params[:id])
        project = Project.where(project_manager: project_manager.id).where(completed: false).first
        users = project.assigned_to
        if users
            render json: {users: users, status: 200}
        end
    end


end