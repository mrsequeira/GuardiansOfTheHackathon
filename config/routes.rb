Rails.application.routes.draw do
  get 'welcome/Index'

  namespace :api do
    namespace :v1 do
      
      resources :events 
      #resource :authentication
      post 'authenticate', to: 'authentication#authenticate'
   
    end  
  end

end
