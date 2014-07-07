class ArtistsController < ApplicationController

	def index
	end 

	def show
		id = params[:id]
		@artist = User.find(id)
		@pieces = @artist.piece
	end

end