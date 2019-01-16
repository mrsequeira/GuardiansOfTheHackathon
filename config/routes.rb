Rails.application.routes.draw do
  apipie
  get 'welcome/Index'

  # namespace :api do
    # namespace :v1 do
    resources :participants
      resources :mentors
    # end
    resources :teams
    resources :themes
    resources :team_themes
    # end
  # end

  root 'participants#index'
  #root 'mentors#index'
end
