require "rails_helper"

describe Country do
  context "validates" do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_presence_of :country_code}
  end
end
