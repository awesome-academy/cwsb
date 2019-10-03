require "rails_helper"

RSpec.describe Review, type: :model do
  context "associations" do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :venue}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :content}
  end
end
