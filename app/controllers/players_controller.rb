class PlayersController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_player, only: %i[ show destroy ]

  def index
    @players = Player.all
  end

  def show
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      render :show, player: @player, status: :created, notice: t(".created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @player.destroy
    redirect_to players_url, notice: "Player was successfully deleted."
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.expect(player: %i[ account_id first_name last_name email_address ])
  end
end
