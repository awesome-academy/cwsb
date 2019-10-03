require "rails_helper"

RSpec.describe Permission, type: :model do
  context "associations" do
    it {is_expected.to belong_to :role}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :object_type}
  end
end
