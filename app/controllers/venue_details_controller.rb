class VenueDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_venue, only: [:edit, :update]

  def edit
    @venue.images.build unless @venue.images.any?
    @venue_details = VenueDetailForm.new @venue
  end

  def update
    if @venue.update_attributes venue_params
      flash[:success] = t "flash.success_detail"
      redirect_to edit_venue_venue_detail_path @venue
    else
      render :edit
    end
  end

  private
  def load_venue
    @venue = Venue.find_by id: params[:venue_id]
    unless @venue
      flash[:danger] = t "flash.danger_message"
      redirect_to root_url
    end
  end

  def venue_params
    params.require(:venue_detail).permit(:number_of_floors, :floor_space,
      :number_of_rooms, :number_of_desks,
      images_attributes: [:id, :picture],
      working_times_attributes: [:id, :day_in_week, :working_to,
        :working_from, :status]).merge! user: current_user
  end
end
