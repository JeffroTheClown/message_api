require 'pp'

class LocationsController < ApplicationController

  def index
    @locations = Location.where :receiving_user_id => params[:receiving_user_id] if params[:receiving_user_id]
    @locations = Location.where :sending_user_id => params[:sending_user_id] if params[:sending_user_id]
    pp @locations.first
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
    @location.message = params[:message]
    @location.save!
    respond_with @location
  end

end