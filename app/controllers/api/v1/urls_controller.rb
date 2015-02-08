class Api::V1::UrlsController < ApplicationController
  respond_to :json

  def create
    respond_with(Url.create(url_params))
  end

  private

  def url_params
    params.require(:url).permit(:full_url)
  end
end
