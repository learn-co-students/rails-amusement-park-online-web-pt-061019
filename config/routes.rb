Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#home'

  resources :users
  resources :attractions
  resources :rides

  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

end
