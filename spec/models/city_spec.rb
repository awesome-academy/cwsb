require "rails_helper"

describe City do
  context "associations" do
    it {is_expected.to belong_to :country}
    it {is_expected.to have_many :counties}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_presence_of :postal_code}
  end
end
