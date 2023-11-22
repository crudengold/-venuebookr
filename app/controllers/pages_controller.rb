class PagesController < ApplicationController
  def home
    @venues = Venue.all
  end

  def dashboard
    @user = current_user
  end
end
