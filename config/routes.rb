Rails.application.routes.draw do
  get 'home/index'
  resources :player_games
  resources :rounds
  resources :games
  resources :players, only: [:create]

  post '/login', to: 'auth#login'
  get '/auto_login', to: 'auth#auto_login'
  get '/player_is_authenticated', to: 'auth#player_is_authenticated'

  # get 'signup', to: 'players#new', as: 'signup'
  # get 'login', to: 'sessions#new', as: 'login'
  # get 'logout', to: 'sessions#destroy', as: 'logout'
end