class UrlsController < ApplicationController

  def index
    @url = Url.new
  end

end
