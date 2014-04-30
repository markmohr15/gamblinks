class CommentsController < ApplicationController
def create
    @link = Link.find(params[:link_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.link_id = @link.id
    if @comment.save
      redirect_to link_url(@comment.link)
    else
      redirect_to link_url(@comment.link)
    end
  end

  def show
  end

  def destroy
    @comment = Comment.find(params[:id])

    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to link_url(@comment.link)
    else
      redirect_to link_url(@comment.link)
    end
  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end
end



