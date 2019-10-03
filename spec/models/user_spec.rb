require "rails_helper"

RSpec.describe User, type: :model do
  context "associations" do
    it {is_expected.to have_one :image}
    it {is_expected.to have_many :bookings}
    it {is_expected.to have_many :reviews}
    it {is_expected.to have_many :invoices}
    it {is_expected.to have_many :notifications}
    it {is_expected.to have_many :roles}
    it {is_expected.to have_many :venues}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :email}
    it {is_expected.to validate_presence_of :password}
    it {is_expected.to validate_length_of(:password).is_at_least 8}
    it {is_expected.to validate_length_of(:password).is_at_most 16}
  end
end
