Rails.application.routes.draw do
  root 'users#home'
  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :attractions
  resources :rides, only: [:create]
end
