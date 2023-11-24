class BookingsController < ApplicationController

  #http://localhost:3000/venues/1/bookings/new

  def index
    @user = current_user
    @bookings = @user.bookings.all
  end

  def show
    @user = User.find(params[:user_id])
    @booking = Booking.find(params[:id])
    @venue = Venue.find(@booking.venue_id)
  end


  def new
    @venue = Venue.find(params[:venue_id])
    @booking = Booking.new
  end

  def create
    @venue = Venue.find(params[:venue_id])
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @booking.venue = @venue
    if @booking.save!
      redirect_to dashboard_path
      flash[:message] = 'Your Booking was Created Successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to booking_path(@booking.venue), status: :see_other
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
