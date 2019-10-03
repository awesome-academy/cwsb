require "rails_helper"

RSpec.describe VenueDetailsController, type: :controller do
  before do
    sign_in FactoryGirl.create(:user)
  end

  context "GET #edit" do
    let!(:venue) {FactoryGirl.create :venue}
    before do
      get :edit, params: {venue_id: venue.id}
    end

    it "renders the index template" do
      expect(response).to render_template(:edit)
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  context "PATCH #update" do
    let!(:venue) {FactoryGirl.create :venue}
    it "responds successfully" do
      patch :update, params: {venue_id: venue.id, venue_detail: {number_of_floors: 12, floor_space: 11}}
      expect(flash[:success]).not_to be_empty
    end

    it "responds error" do
      process :update, method: :put, params: {venue_id: 0}
      expect(response).to render_template()
    end

    it "responds error" do
      process :update, method: :put,
        params: {venue_id: venue.id, venue_detail: {number_of_floors: 12,
        working_times_attributes: [day_in_week: ""]}}
      expect(response).to render_template(:edit)
    end
  end
end
