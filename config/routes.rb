Rails.application.routes.draw do
  root 'static#home'
  resources :users
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
end
