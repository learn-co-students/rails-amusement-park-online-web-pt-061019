Rails.application.routes.draw do
  root "application#index"
  resources :users

  get '/signin' => "sessions#new"
  post '/signin' => "sessions#create"
  delete '/signout' => "sessions#destroy"
  get '/signup' => "users#new"
  post '/signup' => "users#create"
  get 'rides/create'
  post '/ride' => "rides#create"
  # get 'attractions/index'
  # get 'attractions/new'
  # get 'attractions/create'
  # get 'attractions/show'
  resources :attractions
  resources :rides
  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
