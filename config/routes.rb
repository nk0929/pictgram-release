Rails.application.routes.draw do
  # get 'topics/new'

  get 'sessions/new'
  # get 'users/new'
  get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/help'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :topics
  resources :favorites


  get 'favorites/index'
  post '/favorites/:topic_id/create', to: 'favorites#create'
  post '/favorites/:topic_id/destroy', to: 'favorites#destroy'

  # get 'users/:id' => 'users#show'
end
