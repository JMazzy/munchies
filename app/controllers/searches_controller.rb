class SearchesController < ApplicationController

  def index
    @search = Search.last
    @trucks = Soda.new.search(@search.get_latitude, @search.get_longitude);
    @hash = Gmaps4rails.build_markers(@search) do |user, marker|
      marker.lat user.get_latitude
      marker.lng user.get_longitude
    end
  end

  def create
    @search = Search.new
    @search.address = params[:address]

    respond_to do |format|
      if @search.save
        @trucks = Soda.new.search(@search.get_latitude, @search.get_longitude);
        @hash = Gmaps4rails.build_markers(@search) do |user, marker|
          marker.lat user.get_latitude
          marker.lng user.get_longitude
        end

        format.html { redirect_to searches_path }
        format.js
      else
        render :new
      end
    end
  end
end
