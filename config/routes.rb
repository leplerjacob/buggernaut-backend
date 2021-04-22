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
    get '/users_projects', to: 'projects#users_projects'
    get '/current_tasks_and_tickets', to: 'projects#current_tasks_and_tickets'
    get '/open_projects_tasks_and_tickets', to: 'projects#open_projects_tasks_and_tickets'
    #************** PROJECT **************#
    
    #************** TASK **************#
    resources :tasks, only: [:create, :index, :show, :update]
    put '/tasks/update_status/:id', to: 'tasks#dev_update_status'
    get '/tasks_by_project', to: 'tasks#tasks_for_project'
    put '/task_update_status/:id', to: 'tasks#dev_update_status'
    #************** TASK **************#
    
    #************** TICKET **************#
    resources :tickets, only: [:create, :show, :update]
    put '/tickets/claim/:id', to: 'tickets#claim_ticket'
    put '/tickets/update_status/:id', to: 'tickets#update_status'
    #************** TICKET **************#
    
    #************** USER **************#
    get '/users_by_project/:id', to: 'users#users_by_project'
    #************** USER **************#
    

  end
