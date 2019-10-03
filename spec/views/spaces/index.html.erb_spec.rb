require "rails_helper"

RSpec.describe "spaces/index.html.erb", type: :view do
  context "expected elements when init new" do
    let(:venue) {FactoryGirl.create :venue}
    let(:space) {FactoryGirl.create :space}

    before do
      assign :venue, venue
      assign :spaces, Space.all
    end

    it "should index venue" do
      render
      expect(rendered).to include venue.name
    end
  end
end
