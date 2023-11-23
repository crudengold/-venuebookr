class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @venue = Venue.find(params[:venue_id])
    @review = Review.new
  end

  def create
    @venue = Venue.find(params[:venue_id])
    @review = Review.new(review_params)
    @review.venue = @venue
    @review.user = current_user
    if @review.save!
      redirect_to venue_path(@venue), notice: 'Review was successfully created.'
    else
      render 'venues/show', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
