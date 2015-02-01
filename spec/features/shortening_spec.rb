require "rails_helper"

describe "Shortening urls", type: :feature do

  it "can enter a url and get a short version" do
    visit root_path
    fill_in("url[full_url]", with: "http://blog.turing.io/2014/12/09/making-the-switch-into-a-tech-career/")
    click_button("Shrimpy Me")

    expect(current_path).to eq(root_path)
    expect(page).to have_text("Your URL has been shrimped")
    expect(page).to have_text(Url.last.slug)
  end

  it "sees the shortened urls listed and sorted by date added" do
    url = create(:url)
    newer_url = create(:url, full_url: "http://google.com")

    visit root_path
     fill_in("url[full_url]", with: "http://blog.turing.io/2014/12/09/making-the-switch-into-a-tech-career/")
     click_button("Shrimpy Me")

     expect(newer_url.slug).to appear_before(url.slug)
     expect("http://blog.turing.io/2014/12/09/making-the-switch-into-a-tech-career/").to appear_before(newer_url.full_url)

  end
end


