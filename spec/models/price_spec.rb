require "rails_helper"

RSpec.describe Price, type: :model do
  context "associations" do
    it {is_expected.to belong_to :space}
    it {is_expected.to belong_to :booking_type}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :price}
  end
end
