class LinksController < ApplicationController
  def index
    @links = Link.all.order('votes_count DESC').page(params[:page])
  end

  def show
    @link = Link.find(params[:id])
    @comments = @link.comments.page(params[:page])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.address = @link.address.sub(/^https?\:\/\//, '').sub(/^www./,'')
    @link.address.chop! if @link.address.end_with? '/'
    @link.user_id = current_user.id
    if Link.where(address: @link.address).any?
      @fetch_link_id = Link.where(address: @link.address).map { |link| link.id }
      @fetch_user_id = Link.where(address: @link.address).map { |link| link.user_id }
      @vote = Vote.new
      @vote.user_id = current_user.id
      @vote.link_id = @fetch_link_id[0]
      if @fetch_user_id[0] == current_user.id
        redirect_to link_path(@vote.link_id)
        flash[:alert] = "You already submitted this link."
      elsif Vote.where(link_id: @fetch_link_id[0], user_id: current_user.id).any?
        redirect_to link_path(@vote.link_id)
        flash[:alert] = "You already voted for this link."
      else
        @vote.save
        redirect_to link_path(@vote.link_id)
        flash[:notice] = "This link was submitted by someone else.  Your submission
        was treated as a vote."
      end
    else
      if @link.save
        LinkMailer.link_notification(@link).deliver
        redirect_to link_url(@link)
        flash[:notice] = "Thanks for submitting a link."
      else
        render action: :new
      end
    end
  end

  def about
  end

private

  def link_params
    params.require(:link).permit(:title, :address)
  end



end
