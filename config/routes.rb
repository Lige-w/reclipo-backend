Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :projects, only: [:create, :index, :show]
      resources :references, only: [:create]
      resources :notes, only: [:create, :update]
    end
  end
end