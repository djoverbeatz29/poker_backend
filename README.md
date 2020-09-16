# REACT HOLD EM
A simple React-based app, with a Ruby on Rails backend, that allows a player to log in and out and play Hold 'Em against bots.

# Database Schema

## Player  
## Attributes:
  - username
  - first_name
  - last_name
  - password
  - email
  - account_balance
  - game_balance
  - amount_bet
## Has many:
  - PlayerGames  
  - Games, through: PlayerGames

## Game  
## Attributes:
  - min_bet
  - number_of_players
  - winner_id
  - button_id
## Has many:
  - PlayerGames  
  - Players, through: PlayerGames  
  - Rounds  

## Round  
### Attributes:
  - current_player_id
  - step
  - avail_players
  - float pool
  - boolean is_over
## Belongs to:
  - Game
