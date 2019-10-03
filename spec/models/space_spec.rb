require "rails_helper"

RSpec.describe Space, type: :model do
  context "associations" do
    it {is_expected.to have_many :images}
    it {is_expected.to have_many :bookings}
    it {is_expected.to have_many :coupons}
    it {is_expected.to have_many :prices}
    it {is_expected.to have_many :booking_types}
    it {is_expected.to belong_to :venue}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :space_type}
    it {is_expected.to validate_presence_of :area}
    it {is_expected.to validate_presence_of :capicity}
    it {is_expected.to validate_presence_of :quantity}
  end
end
