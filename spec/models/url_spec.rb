require "rails_helper"

RSpec.describe Url, :type => :model do

  it "must have a valid full url" do
    url = create(:url)
    url.full_url = nil

    expect(url).not_to be_valid
  end

  it "generates a random slug" do
    url = create(:url)

    expect(url.slug.size).to eq(6)
  end

  it "it cannot have a duplicate slug" do
    url = create(:url)
    another_url = create(:url, full_url: "http://google.com")

    another_url.slug = url.slug

    expect(another_url).not_to be_valid
  end

  it "has many visits" do
    url = create(:url)

    expect(url).to respond_to(:visits)
  end

  describe "title grabber service" do
    WebMock.allow_net_connect!

    it "has a title from the full url target page" do
      url = create(:url)

      expect(url.title).to eq("Making the Switch into a Tech Career")
    end

    it "can grab a page title for the url" do
      full_url = "http://blog.turing.io/2014/12/09/making-the-switch-into-a-tech-career/"
      title =  TitleGrabber.find_title(full_url)

      expect(title).to eq("Making the Switch into a Tech Career")
    end
  end
end
