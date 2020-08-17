class Player < ApplicationRecord
    has_many :player_games
    has_many :games, through: :player_games
    
    has_secure_password
    validates :email, presence: true, uniqueness: true
end