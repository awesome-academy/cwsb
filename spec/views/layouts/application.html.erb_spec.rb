require "rails_helper"

describe "layouts/application.html.erb" do
  before {render}

  context "expect display elements" do
    it {expect(rendered).to match /CWBS/}
    it {expect(rendered).to match /Framgia/}
    it {expect(rendered).to match /if lt IE 9/}
  end
end
