class HostsController < ApplicationController

	def show
		id = params[:id]
		@host = User.find(id)
		@venues = @host.venues
		@events = @host.events_hosted
		@venue_new = Venue.new
	end 

end