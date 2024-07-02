class SolutionsController < ApplicationController
  def index
    @party = Party.find(params[:party_id])
    @solutions = Solution.where(party_id: @party.id)
  end

  def new
    @party = Party.find(params[:party_id])
    @solution = Solution.new
  end

  def create
    @party = Party.find(params[:party_id])
    @solution = Solution.new
    @solution.word = @solution.find_word_by_party_ten_letter_list
    @solution.party = @party
    if @solution.save
      redirect_to party_solutions_path(@party)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
