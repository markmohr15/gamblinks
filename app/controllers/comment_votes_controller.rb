class CommentVotesController < ApplicationController
  def create
    #@link = Link.find(params[:link_id])
    @comment = Comment.find(params[:comment_id])
    @comment_vote = CommentVote.new
    @comment_vote.user_id = current_user.id
    @comment_vote.comment_id = @comment.id
    if @comment.can_vote?(current_user)
      @comment_vote.save
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      flash[:alert] = "Can't vote for yourself, sorry 'bout it."
    end
  end
end
