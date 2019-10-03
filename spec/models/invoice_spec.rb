require 'rails_helper'

RSpec.describe Invoice, type: :model do
  context "associations" do
    it {is_expected.to belong_to :coupon}
    it {is_expected.to belong_to :booking}
  end
end
