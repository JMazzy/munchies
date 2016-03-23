class LocationsController < ApplicationController

  def create
    @location = Location.new
    @location.address = params[:location]
    @location.save
    redirect_to searches_path
  end
end
