require "rails_helper"

RSpec.describe "search/spaces/index.html.erb", type: :view do
  context "expected elements when init search" do
    before do
      assign :addresses, []
      render
    end
    it {expect(rendered).to match /Maps/}
    it {expect(rendered).to match /Find Space/}
    it {expect(rendered).to match /id="map"/}
    it {expect(rendered).to match /Desk/}
    it {expect(rendered).to match /Prive_office/}
    it {expect(rendered).to match /Meeting_room/}
    it {expect(rendered).to match /day/}
    it {expect(rendered).to match /week/}
    it {expect(rendered).to match /month/}
    it {expect(rendered).to match /Space type/}
    it {expect(rendered).to match /Term/}
  end
end
