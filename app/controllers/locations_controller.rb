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

end