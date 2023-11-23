class BookmarksController < ApplicationController

  def new
    @venue = Venue.find(params[:venue_id])
    @user = current_user
    @bookmark = Bookmark.new
  end

  def create
    @venue = Venue.find(params[:venue_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.venue = @venue
    @bookmark.user = current_user
    if @bookmark.save!
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:bookmarked)
  end

end
