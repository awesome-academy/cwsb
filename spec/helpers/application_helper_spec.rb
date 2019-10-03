require "rails_helper"

describe ApplicationHelper do
  describe "#full_title" do
    it "returns the title with the page_title" do
      page_title = "Test title"
      expect(helper.full_title page_title).to eql "Test title | CWBS"
    end

    it "return the base title" do
      expect(helper.full_title).to eql "CWBS"
    end
  end
end
