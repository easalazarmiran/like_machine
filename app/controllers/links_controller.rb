class LinksController < ApplicationController

  skip_before_action :authenticate_user!, only: :index

  def index
    @links_by_date = Link.top.group_by{ |l| l.created_at.to_date }
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.build(title: link_params[:title], url: link_params[:url])
    if @link.save
      redirect_to root_path, flash: { notice: 'Link added succesfully' }
    else
      render :new
    end
  end

  def destroy
    link = current_user.links.find(params[:id])
    if link.destroy
      redirect_to root_path, flash: { notice: 'Link deleted succesfully' }
    else
      render :index, flash: { notice: 'Link could not be deleted' }
    end
  end

  private

  def link_params
    params.require(:Link).permit(:title, :url)
  end
end
