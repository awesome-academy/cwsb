require "rails_helper"

RSpec.describe SpacesController, type: :controller do
  let(:space) do
    mock_model Space, space: space, venue: venue
  end
  let(:venue) {FactoryGirl.create(:venue)}

  before do
    sign_in FactoryGirl.create(:user)
  end

  describe "GET #index" do
    let(:spaces) {FactoryGirl.create(:spaces, venue: venue)}
    it "load success" do
      get :index, params: {venue_id: venue.id}
      expect(response).to render_template "index"
    end

    it "load error venues" do
      get :index, params: {venue_id: 0}
      expect(flash[:danger]).not_to be_empty
      response.should redirect_to venues_path
    end
  end

  describe "GET #new" do
    it "should create space" do
      get :new, params: {venue_id: venue.id}
      expect(response).to render_template "new"
    end
  end

  describe "POST #create" do
    it "should created space" do
      post :create, {venue_id: venue,
        space: FactoryGirl.attributes_for(:space, venue_id: venue.id)}
      response.should redirect_to venue_spaces_path
    end

    it "don't created space" do
      post :create, {venue_id: venue,
        space: FactoryGirl.attributes_for(:space, venue_id: venue.id, area: nil)}
      expect(flash[:danger]).not_to be_empty
      expect(response).to render_template "new"
    end
  end
end
