require "rails_helper"

describe "layouts/shared/_footer.html.erb" do
  before {render}

  context "elements on menu" do
    it {expect(rendered).to match /CWBS/}
    it {expect(rendered).to match /Framgia/}
  end
end
