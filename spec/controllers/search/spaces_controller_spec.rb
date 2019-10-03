require "rails_helper"
include GeneralHelper

RSpec.describe Search::SpacesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "renders the index template" do
      xhr :get, :index
      expect(response).to render_template(:index)
    end

    context "check for gmaps rails" do
      let!(:venue) {FactoryGirl.create :venue}
      let(:addresses) {[venue.address]}
      let(:hash) {mark_to_maps(addresses)}

      it "stubs :latitude" do
        expect(venue.address.latitude).not_to be_nil
      end
      it "stubs :longitude" do
        expect(venue.address.longitude).not_to be_nil
      end
      it "markers :latitude" do
        expect(hash.first.values.first).to eql venue.address.latitude
      end
      it "markers :longitude" do
        expect(hash.first.values.second).to eql venue.address.longitude
      end
    end
  end

  describe "GET #show" do
    let(:space) {FactoryGirl.create :space}
    before do
      get :show, id: space.id
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      expect(response).to render_template(:show)
    end
  end
end
