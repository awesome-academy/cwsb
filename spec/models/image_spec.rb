require 'rails_helper'

RSpec.describe Image, type: :model do
  context "associations" do
    it {is_expected.to belong_to :imageable}
  end

  context "validates" do
    it {is_expected.to validate_presence_of :picture}
  end
end
