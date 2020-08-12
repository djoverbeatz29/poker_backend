class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :update, :destroy]

  # GET /players
  def index
    @players = Player.all

    render json: @players
  end

  # GET /players/1
  def show
    render json: @player
  end

  # POST /players
  def create
    @player = Player.new(player_params)
    if @player.valid?
      payload = {player_id: player.id}
      token = encode_token(payload)
      render json: {player: player, jwt: token}
    else
      render json: {errors: @player.errors.full_messages}, status: :not_acceptable
    end

  end

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # DELETE /players/1
  def destroy
    @player.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_params
      params.require(:player).permit(:account_balance, :game_balance, :amount_bet, :username, :first_name, :last_name, :email, :password_digest)
    end
end
