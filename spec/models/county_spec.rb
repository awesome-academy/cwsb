require "rails_helper"

describe County do
  context "associations" do
    it {is_expected.to belong_to :city}
    it {is_expected.to have_many :addresses}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :name}
  end
end
