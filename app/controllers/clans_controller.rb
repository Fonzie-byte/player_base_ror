class ClansController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_clan, only: [ :show, :destroy ]

  def index
    @clans = Clan.all
  end

  def show
    # Todo: Cache?
    levels = @clan.characters.map { |c| c.level }
    @average_level = (levels.reduce(:+) / levels.size.to_f)
    @median_level = levels.sort[(levels.size - 1) / 2.0]
    @total_level = levels.reduce(:+)
  end

  def destroy
    @clan.destroy
    redirect_to clans_url, notice: "Clan was successfully deleted."
  end

  private

  def set_clan
    @clan = Clan.find(params[:id])
  end
end
