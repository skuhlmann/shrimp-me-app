require "rails_helper"

RSpec.describe UrlsController do

  it "redirects a valid shortened url" do
    url = create(:url)

    get(:show, slug: url.slug)

    expect(response.header["Location"]).to eq(url.full_url)
  end
end
