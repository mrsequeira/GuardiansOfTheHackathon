Rails.application.routes.draw do
  get 'welcome/Index'

  namespace :api do
    # namespace :v1 do
    resources :participants
    # end
    resources :teams do
      get '/themes', to: 'teams#indexTeams'
    end

    resources :themes do
      get '/teams', to: 'themes#indexThemes'
    end
    # resources :themes, format: "json" do
    #  resources :teams, format: "json"
    # end
  end

  root 'participants#index'
end
