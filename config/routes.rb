Rails.application.routes.draw do
  get 'welcome/Index'

  # namespace :api do
  #   namespace :v1 do
        resources :participants
  #   end
  # end
  resources :teams, format: "json" do
    resources :themes
  end
  root 'participants#index'
end
