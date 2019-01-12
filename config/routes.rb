Rails.application.routes.draw do
  apipie
  get 'welcome/Index'

  namespace :api do
    namespace :v1 do
      resources :participants
      resources :events 
      #resource :authentication
      
      post 'authenticate', to: 'authentication#authenticate'
   
    end  
  end

end
