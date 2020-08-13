Rails.application.routes.draw do
  get 'home/index'
  resources :player_games
  resources :rounds
  resources :games
  resources :players

  post '/login', to: 'auth#login'
  get '/auto_login', to: 'auth#auto_login'
  get '/player_is_authenticated', to: 'auth#player_is_authenticated'
  
end