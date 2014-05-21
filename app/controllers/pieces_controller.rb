class PiecesController < ApplicationController

	def index
	end 

	def create
		Piece.create(piece_attributes)
		user_id = piece_attributes[:user_id]
		user = User.find(user_id)
		user.is_artist = true
		user.save

		redirect_to "/users/#{user_id}"
	end

	private

  	def piece_attributes
    	params.require(:piece).permit(:url, :user_id)
  	end
end