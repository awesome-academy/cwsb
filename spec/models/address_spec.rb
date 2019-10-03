require "rails_helper"

describe Address do
  context "associations" do
    it {is_expected.to belong_to :county}
    it {is_expected.to belong_to :venue}
  end

  context "validate" do
    it {is_expected.to validate_presence_of :details}
  end
end
