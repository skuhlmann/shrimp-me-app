require "rails_helper"

describe "Shortening urls", type: :feature do

  it "can enter a url and get a short version" do
    visit root_path
    fill_in("url", with: "http://blog.turing.io/2014/12/09/making-the-switch-into-a-tech-career/")
    click_button("Shrimpy Me")

    expect(page).to have_text("Your URL has been shrimped")

  end
end


