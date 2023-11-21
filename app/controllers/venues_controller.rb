class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render new, status: 422
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :description, :location, :capacity, :price_per_hour)
  end
end
