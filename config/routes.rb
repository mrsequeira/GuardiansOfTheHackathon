Rails.application.routes.draw do
  apipie
  get 'welcome/Index'

  namespace :api do
    namespace :v1 do
      # Controller resources
      resources :users
      resources :roles
      resources :user_roles
      resources :events 
      resources :participants
      
      post 'authenticate', to: 'authentication#authenticate' #create
      post 'login', to: 'authentication#login'
      get '/:token/confirm_email/', :to => "authentication#confirm_email", as: 'confirm_email'
      
      post 'forgot', :to => "authentication#forgot"
      post '/:token/reset/', :to => "authentication#reset"
    
    end  
  end

end
