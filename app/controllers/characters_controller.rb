class CharactersController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_character, only: %i[ show destroy ]

  def index
    @characters = Character.all
  end

  def show
  end

  def destroy
    @character.destroy
    redirect_to characters_url, notice: "Character was successfully deleted."
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end
end
