require "rails_helper"

RSpec.describe Api::V1::UrlsController do
  WebMock.allow_net_connect!

  it "can create a url record" do
    post(:create, format: :json, url: { full_url: "http://google.com" })
    result = JSON.parse(response.body)

    expect(result["slug"]).to eq(Url.last.slug)
    expect(result["title"]).to eq("Google")
    expect(result["full_url"]).to eq("http://google.com")
  end
end
