module CurrentUserConcern
  # doc: https://api.rubyonrails.org/v6.1.3/classes/ActiveSupport/Concern.html
  extend ActiveSupport::Concern

  included do
    # doc on before_action: https://guides.rubyonrails.org/action_controller_overview.html

    # possible alt to before_action: https://dmshvetsov.medium.com/an-alternative-to-rails-before-action-eb010c3ffbfb
    before_action :set_current_user
  end

  # if user_id is set in browser cookie, set the instance var current_user to user (user is logged in)
  def set_current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end
end
