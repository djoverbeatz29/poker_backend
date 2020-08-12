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
        byebug
        player = Player.find_by(username: params[:username])
        if player && player.authenticate(params[:password_digest])
            payload = {player_id: player.id}
            token = encode_token(payload)
            render json: {player: player, jwt: token}
        else
            render json: {errors: player.errors.full_messages}, status: :not_acceptable
        end
    end

    def user_is_authenticated
        render json: {message: "Authorized"}
    end

end