class AuthController < ApplicationController
    skip_before_action :require_login, only: [:login, :auto_login]

    def auto_login
        if session_player
            render json: session_player
        else
            render json: {errors: "No user logged in"}
        end
    end

    def login
        player = Player.find_by(username: params[:username])
        if player && player.authenticate(params[:password])
            payload = {"player_id": player.id}
            string = "Chicago"
            token = JWT.encode(payload, string, 'HS256')
            obj = {player: player, token: token}
            p obj
            render json: {player: player, token: token}
        else
            render json: {"message": "invalid credentials"}, status: 401
        end
    end

    def user_is_authenticated
        render json: {message: "Authorized"}
    end

end