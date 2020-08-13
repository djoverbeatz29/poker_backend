Rails.application.routes.draw do
  get 'home/index'
  resources :player_games
  resources :rounds
  resources :games
  resources :players

  post '/login', to: 'auth#login'
  get '/player', to: 'auth#show'
  
end