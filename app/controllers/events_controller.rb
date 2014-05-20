class EventsController < ApplicationController

	def index

		@events = Event.order(:start_time)
	
	end 

	def show 
		id = params[:id]
		@event = Event.find(id)
		@venue = @event.venue
		@host = @venue.user
		@artists = @event.artists


	end


end