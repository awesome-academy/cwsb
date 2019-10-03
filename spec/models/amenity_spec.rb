require "rails_helper"

RSpec.describe Amenity, type: :model do
  context "associations" do
    it {is_expected.to have_many :venue_amenities}
    it {is_expected.to have_many :images}
    it {is_expected.to have_many :venues}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :name}
  end
end
