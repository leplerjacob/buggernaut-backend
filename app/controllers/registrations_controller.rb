class RegistrationsController < ApplicationController
  def create
    user =
      User.create!(
        first_name: params['user']['first_name'],
        last_name: params['user']['last_name'],
        username: params['user']['username'],
        phone_number: params['user']['phone_number'],
        email: params["user"]["email"],
        role: params['user']['role'],
        password: params['user']['password'],
        password_confirmation: params['user']['password_confirmation']
      )

    if user
      session[:user_id] = user.id
      render json: { status: :created, user: user }
    else
      render json: { status: 500 }
    end
  end
end
