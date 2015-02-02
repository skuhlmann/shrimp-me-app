class UrlsController < ApplicationController
  def index
    @url = Url.new
    @urls = Url.order(created_at: :desc)
  end

  def show
    @url = Url.find_by(slug: params[:slug])
    if @url.presence
      redirect_to @url.full_url
    else
      flash[:notice] = "Redirect doesn't exist"
      redirect_to root_path
    end
  end

  def create
    @url = Url.create(url_params)
    if @url.save
      flash[:notice] = "Your URL has been shrimped"
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def url_params
    params.require(:url).permit(:full_url)
  end
end
