require "rails_helper"

RSpec.describe WorkingTime, type: :model do
  context "associations" do
    it {is_expected.to belong_to :venue}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :working_from}
    it {is_expected.to validate_presence_of :working_to}
    it {is_expected.to validate_presence_of :day_in_week}
  end
end
