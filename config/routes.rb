Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #put the root route here
  root to: "welcome#index"
  resources :users, only: [:new, :create, :show, :update]
  resources :rides
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
end
