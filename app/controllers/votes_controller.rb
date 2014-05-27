class VotesController < ApplicationController
  def create
    @link = Link.find(params[:link_id])
    @vote = Vote.new
    @vote.user_id = current_user.id
    @vote.link_id = @link.id
    if @link.votable_by?(current_user)
      @vote.save
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
      flash[:notice] = "Thanks for your vote"
    else
      flash[:alert] = "Can't vote for yourself, sorry 'bout it."
    end
  end
end

