require "rails_helper"

RSpec.describe Role, type: :model do
  context "associations" do
    it {is_expected.to have_many :permissions}
    it {is_expected.to have_many :admins}
    it {is_expected.to have_many :user_role_venues}
    it {is_expected.to have_many :venues}
    it {is_expected.to have_many :users}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :type}
    it {is_expected.to validate_presence_of :name}
  end
end
