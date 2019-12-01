Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :rides
  resources :attractions
  resources :sessions

  # get '/', to: 'static#home', as: 'root'
  root 'static#home'

  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'
  # post '/users/:id', to: 'users#update'
end
