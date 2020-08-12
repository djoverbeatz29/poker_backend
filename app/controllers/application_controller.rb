class ApplicationController < ActionController::API
  before_action :require_login

    def encode_token(payload)
      JWT.encode(payload, "#MeuSegredo")
    end

    def auth_header
      request.headers["Authorization"]
    end

    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        begin
          JWT.decode(token, '#MeuSegredo', true, algorithm: 'HS256')
        rescue JWT::DecodeError
          []
        end
      end
    end

    def session_player
      decoded_hash = decoded_token
      if !decoded_hash.empty?
        player_id = decoded_hash[0]['player_id']
        @player = Player.find_by(player_id)
      else
        nil
      end
    end

    def logged_in?
      !!session_player
    end

    def require_login
        render json: {message: "Please login"}, status: :unauthorized unless logged_in?
    end

end