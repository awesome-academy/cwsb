require "rails_helper"

RSpec.describe Booking, type: :model do
  context "associations" do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :space}
    it {is_expected.to belong_to :booking_type}
    it {is_expected.to have_one :invoice}
    it {is_expected.to have_many :notifications}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :booking_from}
    it {is_expected.to validate_presence_of :duration}
    it {is_expected.to validate_presence_of :quantity}
  end
end
