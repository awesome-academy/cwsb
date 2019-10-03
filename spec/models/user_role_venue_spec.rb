require "rails_helper"

RSpec.describe UserRoleVenue, type: :model do
  context "associations" do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :role}
    it {is_expected.to belong_to :venue}
  end
end
