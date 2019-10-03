require "rails_helper"

describe "layouts/admin/_header.html.erb" do
  before {render}

  context "element on header admin" do
    it {expect(rendered).to match /Account/}
    it {expect(rendered).to match /Profile/}
    it {expect(rendered).to match /Settings/}
  end
end
