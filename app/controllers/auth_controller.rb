class AuthController < ApplicationController
    # skip_before_action :require_login, only: [:login, :auto_login]

    def login
        player = Player.find_by(username: params[:username])
        if player && player.authenticate(params[:password])
            payload = {"player_id": player.id}
            token = JWT.encode(payload, "Chicago", "HS256")
            obj = {player: player, token: token}
            p obj
            render json: {player: player, token: token}
        else
            render json: {"message": "invalid credentials"}, status: 401
        end
    end

    def show
        # decoding token from front end
        token = request.headers[:Authorization].split()[1]
        decoded = JWT.decode(token, "Chicago", true, {algorithm: "HS256"})
        player_id = decoded[0]['player_id']
        player = Player.find(player_id)
        if player
            render json: {id: player.id, username: player.username, token: token}
        else
            render json: {message: "Invalid token."}, status: 401
        end
    end

end