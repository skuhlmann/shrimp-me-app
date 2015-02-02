require "rails_helper"

RSpec.describe UrlsController do

  it "redirects a valid shortened url" do
    url = create(:url)

    get(:show, slug: url.slug)

    expect(response.header["Location"]).to eq(url.full_url)
  end

  it "counts a visit for the url each time the shortened url is visited" do
    url = create(:url)

    get(:show, slug: url.slug)

    expect(url.visits.count).to eq(1)

    get(:show, slug: url.slug)

    expect(url.visits.count).to eq(2)
  end
end
