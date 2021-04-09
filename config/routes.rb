Rails
  .application
  .routes
  .draw do
    
    #************** SESSION **************#
    resources :sessions, only: [:create]
    get 'logged_in', to: 'sessions#logged_in'
    delete 'logout', to: 'sessions#logout'

    #************** SESSION **************#

    #************** REGISTRATION **************#
    resources :registrations, only: [:create]

    #************** REGISTRATION **************#
  end
