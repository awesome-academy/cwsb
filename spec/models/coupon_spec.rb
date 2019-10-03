require "rails_helper"

RSpec.describe Coupon, type: :model do
  context "associations" do
    it {is_expected.to have_many :invoices}
    it {is_expected.to belong_to :quantity}
    it {is_expected.to belong_to :space}
    it {is_expected.to belong_to :booking_type}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :amount}
    it {is_expected.to validate_presence_of :coupon_type}
  end
end
