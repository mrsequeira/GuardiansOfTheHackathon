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
      
      post 'authenticate', to: 'authentication#authenticate'
      post 'login', to: 'authentication#login'

    end  
  end

end
