require 'rails_helper'

RSpec.describe Visit, :type => :model do
   it "belongs to a url" do
    url = create(:url)
    visit = Visit.create(url_id: url.id)

    expect(visit.url).to eq(url)
  end

end
