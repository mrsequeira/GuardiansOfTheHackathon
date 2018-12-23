Rails.application.routes.draw do
  get 'welcome/Index'

  # namespace :api do
  #   namespace :v1 do
      resources :participants
      resources :mentors
  #   end
  # end

  root 'participants#index'
  #root 'mentors#index'
end
