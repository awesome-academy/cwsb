require "rails_helper"

describe "layouts/admin/application.html.erb" do
  before {render}

  context "expect display elements" do
    it {expect(rendered).to match /Account/}
    it {expect(rendered).to match /Users/}
    it {expect(rendered).to match /Framgia/}
    it {expect(rendered).to match /if lt IE 9/}
  end
end
