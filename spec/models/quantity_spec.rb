require 'rails_helper'

RSpec.describe Quantity, type: :model do
  context "associations" do
    it {is_expected.to have_many :coupons}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :content}
  end
end
