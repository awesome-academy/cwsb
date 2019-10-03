class ServiceChargesController < ApplicationController
  before_action :load_amenity, only: [:create, :update]
  load_resource only: :update

  def create
    @service_charge = @amenity.create_service_charge service_charges_params
    if @service_charge.save
      flash[:success] = t "service_charge.success.create"
      redirect_to venue_amenities_path
    else
      flash[:danger] = t "service_charge.errors.create"
      render :new
    end
  end

  def update
    if @service_charge.update_attributes service_charges_params
      flash[:success] = t "service_charge.success.update"
    else
      flash[:danger] = t "service_charge.errors.update"
    end
    redirect_to venue_amenities_path
  end

  private

  def load_amenity
    @amenity = Amenity.find_by id: params[:amenity_id]
    if @amenity.nil?
      flash[:danger] = t "amenities.errors.load"
      redirect_to root_url
    end
  end

  def service_charges_params
    params.require(:service_charge).permit :price, :price_type_id,
      :quantity
  end
end
