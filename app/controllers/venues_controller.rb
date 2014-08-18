class VenuesController < ApplicationController

  def index
  end 

  def create
    Venue.create(venue_attributes)
    user_id = venue_attributes[:user_id]
    user = User.find(user_id)
    user.has_venue = true
    user.save

    redirect_to "/users/#{user_id}"
  end

  private

  def venue_attributes
    params.require(:venue).permit(:address, :url, :user_id)
  end

end
