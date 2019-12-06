Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :rides
  post "/go_on", to: "rides#go_on", as: "go_on"

  resources :attractions
  resources :users

  
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  root "static#home"
end
