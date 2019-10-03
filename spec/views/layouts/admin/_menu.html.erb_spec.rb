require "rails_helper"

describe "layouts/admin/_menu.html.erb" do
  before {render}

  context "elements on menu" do
    it {expect(rendered).to match /Users/}
    it {expect(rendered).to match /Venues/}
    it {expect(rendered).to match /Booking/}
    it {expect(rendered).to match /Statistics/}
  end
end
