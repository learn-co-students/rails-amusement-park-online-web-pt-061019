Rails.application.routes.draw do

  root 'application#home'

  resources :users
  resources :attractions
  resources :rides

  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

end
