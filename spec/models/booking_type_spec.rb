require "rails_helper"

RSpec.describe BookingType, type: :model do
  context "associations" do
    it {is_expected.to have_many :bookings}
    it {is_expected.to have_many :prices}
    it {is_expected.to have_many :coupons}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :name}
  end
end
