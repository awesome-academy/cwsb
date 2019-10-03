require "rails_helper"

RSpec.describe BookingsController, type: :controller do
  before(:each) do
    login_with create(:user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "reture succress created" do
      xhr :post, :create, {booking: {space: create(:space),
        booking_from: Date.tomorrow, duration: 2, quantity: 1}}
      expect(Booking.count).to eq(1)
    end
    it "reture fail created" do
      xhr :post, :create, {booking: {space: create(:space)}}
      expect(Booking.count).to eq(0)
    end
  end
end
