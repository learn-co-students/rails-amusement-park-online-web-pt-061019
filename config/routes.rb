Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :attractions
  resources :rides
  # resources :users
  get "/users/new", to: "users#new"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  # post "/logout", to: "sessions#destroy"
  root "static#home"
end
