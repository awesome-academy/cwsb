require "rails_helper"

RSpec.describe GeneralHelper, type: :helper do
  let(:image1) {FactoryGirl.create :image}
  let(:image2) {FactoryGirl.create :image}
  let(:images) {
    images = Array.new
    images << image1
    images << image2
  }

  describe "#first_active" do
    it "return the active class" do
      expect(helper.first_active images, image1).to eql "active"
    end

    it "return no active class" do
      expect(helper.first_active images, image2).to eql nil
    end
  end
end
