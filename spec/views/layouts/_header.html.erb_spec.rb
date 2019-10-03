require "rails_helper"

describe "layouts/_header.html.erb" do
  before {render}

  context "expect elements in header" do
    it {expect(rendered).to match /fa fa-bars fa-fw/}
  end
end
