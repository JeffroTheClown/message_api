class LocationsController < ApplicationController

  def index
    @locations = Location.where :receiver_user_id => params[:receiver_user_id] if params[:receiver_user_id]
    @locations = Location.where :sender_user_id => params[:sender_user_id] if params[:sender_user_id]
    respond_with @locations
  end

  def show
    @location = Location.find(params[:id])
    respond_with @location
  end

  def create
    @location = Location.new
    @location.latitude = params[:latitude]
    @location.longitude = params[:longitude]
    @location.receiving_user_id = params[:receiving_user_id]
    @location.sending_user_id = params[:sending_user_id]
    @location.save!
    respond_with @location
  end

end