class PartiesController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @party = Party.new
    @party.game = @game
    five_voyelles_list = ""
    five_consonnes_list = ""
    5.times do
      five_voyelles_list += ["a", "e", "i", "o", "u"].sample
    end
    5.times do
      five_consonnes_list += ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"].sample
    end
    @party.ten_letters_list = five_voyelles_list + five_consonnes_list
  end

  def create
    @game = Game.find(params[:game_id])
    @party = Party.new(party_params)
    @party.available = File.read('./words.txt').split("\n").include?(@party.word)
    @party.game = @game
    @party.available ? @party.score = @party.word.length : @party.score = 0
    if @party.save && @party.valid?
      redirect_to game_party_path(@game, @party)
    else
      @game = Game.find(params[:game_id])
      render :new, status: :unprocessable_entity
    end
  end

  private

  def party_params
    params.require(:party).permit(:word, :ten_letters_list)
  end
end
