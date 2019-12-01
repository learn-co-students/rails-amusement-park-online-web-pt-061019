Rails.application.routes.draw do
  root 'static#home'
  resources :users
  resources :attractions
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
