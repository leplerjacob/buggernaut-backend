Rails
  .application
  .routes
  .draw do
    # using resources: index, new, create, show, edit, update, destroy
    
    #************** SESSION **************#
    resources :sessions, only: [:create]
    get 'logged_in', to: 'sessions#logged_in'
    delete 'logout', to: 'sessions#logout'

    #************** SESSION **************#

    #************** REGISTRATION **************#
    resources :registrations, only: [:create]

    #************** REGISTRATION **************#
    
    #************** PROJECT **************#
    resources :projects, only: [:create, :index, :show]
    #************** PROJECT **************#
    
    #************** TASK **************#
    resources :tasks, only: [:create, :index, :show, :update]
    put '/tasks/update_status/:id', to: 'tasks#dev_update_status'
    #************** TASK **************#
    
    #************** TICKET **************#
    resources :tickets, only: [:create, :show, :update]
    put '/tickets/claim/:id', to: 'tickets#claim_ticket'
    put '/tickets/update_status/:id', to: 'tickets#update_status'
    #************** TICKET **************#

    

  end
