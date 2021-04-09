if Rails.env == 'production'
  # Add when deploying production
else
  Rails.application.config.session_store :cookie_store,
                                         key: '_buggernaut-backend'
end
