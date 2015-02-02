require "rails_helper"

describe "Statistics", type: :feature do

  xit "can sort url list by most visits" do
    url = create(:url)
    newer_url = create(:url, full_url: "http://google.com")
    Visit.create(url_id: url.id)

    visit root_path

    expect(newer_url.slug).to appear_before(url.slug)

    choose("Visits (click to sort by popularity)")

    expect(url.slug).to appear_before(newer_url.slug)
  end
end
