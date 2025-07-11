class PlayersController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_player, only: [ :show, :destroy ]

  def index
    @players = Player.all
  end

  def show
  end

  def destroy
    @player.destroy
    redirect_to players_url, notice: "Player was successfully deleted."
  end

  def set_player
    @player = Player.find(params[:id])
  end
end
