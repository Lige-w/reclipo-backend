Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :projects, only: [:create, :index, :show, :destroy]
      resources :references, only: [:create, :index, :update, :destroy]
      resources :notes, only: [:create, :update, :destroy]
      resources :tags, only: [:index]
    end
  end
end