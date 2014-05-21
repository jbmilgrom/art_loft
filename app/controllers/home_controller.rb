class HomeController < ApplicationController

	def index
		@events = Event.order(:start_time)
	end 

end