class HomeController < ApplicationController

	def index
		@events = Event.order(start_time: :desc)
		background_url_array = ["http://www.ibiblio.org/wm/paint/auth/gogh/gogh.chambre-arles.jpg", "http://static.tumblr.com/4fgh2d3/gOblvszld/gallery.jpg", "http://www.inspireyourway.com/wp-content/uploads/2014/05/How-to-Prepare-Your-Files-for-an-Online-Art-Gallery.jpg", "http://artsintherightplace.files.wordpress.com/2011/01/guernica.jpg", "http://upressonline.com/wp-content/uploads/UP7WEB_Art3.jpg", "http://www.extravaganzi.com/wp-content/uploads/2011/04/Pablo-Picasso-Jeane-Fille-Endormie.jpg"]
		@sample = background_url_array.sample
	end 

end