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

  get '/themes/', to: 'themes#index1'
  get '/themes/:id', to: 'themes#show1'
end
