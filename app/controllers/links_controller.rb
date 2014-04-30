class LinksController < ApplicationController
  def index
    @links = Link.all.order('updated_at DESC')
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id

    if @link.save
      redirect_to link_url(@link)
    else
      render action: :new
    end
  end

private

  def link_params
    params.require(:link).permit(:title, :address)
  end
end
