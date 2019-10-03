require "rails_helper"

describe "layouts/_sidebar.html.erb" do
  before {render}

  context "elements on sidebar" do
    it {expect(rendered).to match /CWBS/}
    it {expect(rendered).to match /My account/}
    it {expect(rendered).to match /gi gi-user/}
    it {expect(rendered).to match /gi-envelope/}
    it {expect(rendered).to match /gi gi-cogwheel/}
    it {expect(rendered).to match /gi gi-exit/}
    it {expect(rendered).to match /Search for a space/}
    it {expect(rendered).to match /My co-working spaces/}
    it {expect(rendered).to match /Booking history/}
    it {expect(rendered).to match /Help/}
    it {expect(rendered).to match /How it work/}
    it {expect(rendered).to match /About/}
  end
end
