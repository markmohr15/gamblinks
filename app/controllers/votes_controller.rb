class VotesController < ApplicationController
  def create
    @link = Link.find(params[:link_id])
    @vote = Vote.new
    @vote.user_id = current_user.id
    @vote.link_id = @link.id
    if @vote.save
      redirect_to :back
    else
      redirect_to :back
    end
  end
end

