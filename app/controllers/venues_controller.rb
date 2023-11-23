class VenuesController < ApplicationController
  def index
    if params[:query].present?
      @venues = Venue.search_by_name_and_location(params[:query])
    else
      @venues = Venue.all
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @booking = Booking.new
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :description, :location, :capacity, :price_per_hour, photos: [])
  end
end
