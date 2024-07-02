class GamesController < ApplicationController
  def create
    game = Game.new
    game.user = current_user
    game.save
    redirect_to new_game_party_path(game)
  end

  def show
    @game = Game.find(params[:id])
  end
end
