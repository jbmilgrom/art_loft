class EventsController < ApplicationController

	def index

		@events = Event.all
	end 

	def show 
		id = params[:id]
		@event = Event.find(id)
		@venue = @event.venue
		@host = @venue.user
		@artists = @event.users.uniq


	end


end