class VotesController < ApplicationController
  def create
    @vote = Vote.new
    @vote.user_id = current_user.id
    @vote.link_id =
    if @vote.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

private

 # def vote_params
  #  params.require(:link).permit(:title, :address)
  #end


end
