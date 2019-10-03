require "rails_helper"

describe Admin do
  context "associations" do
    it {is_expected.to validate_presence_of :email}
    it {is_expected.to validate_presence_of :password}
  end

  context "validates" do
    it {is_expected.to validate_length_of(:password).is_at_least 8}
    it {is_expected.to validate_length_of(:password).is_at_most 16}
  end
end
