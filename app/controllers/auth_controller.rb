class AuthController < ApplicationController

    def login
        player = Player.find_by(username: params[:username])
        if player && player.authenticate(params[:password])
            payload = {"player_id": player.id}
            token = JWT.encode(payload, "Chicago", "HS256")
            render json: {player: player, token: token}
        else
            render json: {"message": "invalid credentials"}, status: 401
        end
    end

    def show
        token = request.headers['Authorization'].split()[1]
        decoded_token = JWT.decode(token, "Chicago", true, {algorithm: "HS256"})
        player_id = decoded_token[0]['player_id']
        player = Player.find(player_id)
        if player
            render json: {id: player.id, username: player.username, token: token}
        else
            render json: {message: "Invalid token."}, status: 401
        end
    end

end