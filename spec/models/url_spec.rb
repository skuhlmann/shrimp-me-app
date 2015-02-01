require 'rails_helper'

RSpec.describe Url, :type => :model do

  it "must have a valid full url" do
    url = create(:url)
    url.full_url = nil

    expect(url).not_to be_valid
  end
end
