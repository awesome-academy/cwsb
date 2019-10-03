require "rails_helper"

RSpec.describe VenueAmenity, type: :model do
  context "associations" do
    it {is_expected.to belong_to :venue}
    it {is_expected.to belong_to :amenity}
  end
end
