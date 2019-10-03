FactoryGirl.define do
  factory :image do
    picture do
      Rack::Test::UploadedFile.new File.join(Rails.root, "public", "images",
        "spaces", "space1.jpg")
    end
  end
end
