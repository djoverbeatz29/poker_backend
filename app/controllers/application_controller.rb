class ApplicationController < ActionController::API

  def issue_token(player)
    JWT.encode({player_id: player.id}, "Chicago", 'HS256')
  end

  def token
    request.headers['Authorization']
  end

  def decoded_token
    begin
      JWT.decode(token, "Chicago", true, { :algorithm => 'HS256' })
    rescue JWT::DecodeError
      [{}]
    end
  end

  def session_player
    decoded_hash = decoded_token
    if decoded_hash
      player_id = decoded_hash[0]['player_id']
      @player = Player.find_by(player_id)
    else
      nil
    end
  end

  def require_login
      render json: {message: "Please login"}, status: :unauthorized unless logged_in?
  end
  
  def current_player
    @player ||= Player.find_by(player_id)
  end

  def player_id
    decoded_token.first['player_id']
  end

  def logged_in?
    !!current_user
  end

end