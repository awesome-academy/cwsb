class StoreBookingsController < ApplicationController

  def show
    @venues = current_user.venues
  end

  def update
    @bookings = Booking.where id: params[:booking_ids]
    respond_to do |format|
      @bookings.update_all state: params[:state]
      @bookings.each do |booking|
        BookingMailer.change_status_booking(booking.state, booking.user.email).deliver_later
      end
      format.json do
        render json: {
          flash: I18n.t("flash.success_message")
        }
      end
    end
  end
end
