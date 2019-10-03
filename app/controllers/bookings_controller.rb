class BookingsController < ApplicationController
  before_action :require_logged_in_user, only: :create

  load_resource

  def index
    @bookings = current_user.bookings.without_order
      .group_by{|booking| booking.space.venue}
  end

  def create
    @booking = Booking.new booking_params
    @booking.save
  end

  def update
    respond_to do |format|
      @booking.update state: params[:state]
      BookingMailer.change_status_booking(@booking.state, @booking.user.email).deliver_later
      format.json do
        render json: {
          state: @booking.state,
          flash: I18n.t("flash.success_message")
        }
      end
    end
  end

  def destroy
    respond_to do |format|
      @booking = Booking.find_by id: params[:id]
      if @booking.destroy
        format.json {render json: {message: I18n.t("flash.success_message")}}
      else
        format.json {render json: {message: I18n.t("flash.danger_message")}}
      end
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:space_id, :booking_from, :duration,
      :booking_type_id, :quantity).merge! user: current_user
  end
end
