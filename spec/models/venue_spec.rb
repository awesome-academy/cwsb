require "rails_helper"

RSpec.describe Venue, type: :model do
  context "associations" do
    it {is_expected.to have_one :address}
    it {is_expected.to have_many :images}
    it {is_expected.to have_many :roles}
    it {is_expected.to have_many :users}
    it {is_expected.to have_many :amenities}
    it {is_expected.to have_many :reviews}
    it {is_expected.to have_many :spaces}
    it {is_expected.to have_many :working_times}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :name}
  end
end
