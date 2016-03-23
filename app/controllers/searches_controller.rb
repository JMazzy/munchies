class SearchesController < ApplicationController

  def index
    @location = Location.last
    @trucks = Soda.new.search(@location.get_latitude, @location.get_longitude);
  end

  def search

  end
end
