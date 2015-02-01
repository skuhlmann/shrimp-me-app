require "rails_helper"

describe "Redirecting urls", type: :feature do

  xit "can visit the shortened url and be redirected to the full url" do
    url = create(:url)
    visit root_path

    click_link("Test Me")

    expect(page.current_url).to eq(url.full_url)
  end
end

