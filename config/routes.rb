Rails.application.routes.draw do

  root 'application#home'

  resources :users
  resources :attractions

  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#create'

end
