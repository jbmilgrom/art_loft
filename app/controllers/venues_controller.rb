class VenuesController < ApplicationController

	def index
	end 

	def create
		Venue.create(venue_attributes)

		redirect_to "/users/#{venue_attributes[:user_id]}"
	end

	private

  	def venue_attributes
    	params.require(:venue).permit(:address, :url, :user_id)
  	end

end