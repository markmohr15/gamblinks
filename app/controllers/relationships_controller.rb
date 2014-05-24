class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @relationship = Relationship.new
    @relationship.follower_id = current_user.id
    @relationship.followed_id = @user.id
      if @relationship.save
       redirect_to :back
      else
        redirect_to :back
      end
  end

  def destroy
   @relationship = Relationship.find(params[:id])

    if current_user.id == @relationship.follower_id
      @relationship.destroy
      redirect_to :back
    else
      redirect_to :back
    end
  end
end
