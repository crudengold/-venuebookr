class VenuesController < ApplicationController
  def index
    if params[:query].present?
      @venues = Venue.search_by_name_and_location(params[:query])
    else
      @venues = Venue.all
    end
    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {venue: venue})
      }
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @booking = Booking.new
    @review = Review.new
    @bookmark = Bookmark.new
    @markers = [{
        lat: @venue.latitude,
        lng: @venue.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {venue: @venue})
      }]
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save
      redirect_to venue_path(@venue)
      flash[:message] = 'Your Venue was Created Successfully!'
    else
      render :new, status: :unprocessable_entity
      flash[:message] = 'Missing Fields!'
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :description, :location, :capacity, :price_per_hour, photos: [])
  end
end
