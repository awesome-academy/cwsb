require "rails_helper"

RSpec.describe VenuesController, type: :controller do
  let(:venue) {FactoryGirl.create(:venue)}
  before do
    sign_in FactoryGirl.create(:user)
  end
  describe "GET #index" do
    it "load success" do
      get :index
      expect(response).to render_template "index"
    end
  end

  describe "GET #new" do
    it "created venue success" do
      get :new
      expect(response).to render_template "new"
    end
  end

  describe "POST #create" do
    it "should created venue" do
      post :create, params: {venue: FactoryGirl.attributes_for(:venue)}
      response.should redirect_to edit_venue_path venue
    end

    it "don't create venue" do
      post :create, params: {venue: FactoryGirl.attributes_for(:venue, name: nil)}
      expect(flash[:danger]).not_to be_empty
      expect(response).to render_template "new"
    end
  end

  describe "PUT #update" do
    it "should update success" do
      put :update, id: venue, venue: FactoryGirl.attributes_for(:venue)
      response.should redirect_to edit_venue_path venue
    end

    it "don't update venue" do
      put :update, id: venue, venue: FactoryGirl.attributes_for(:venue, name: nil)
      expect(response).to render_template "edit"
    end
  end
end
