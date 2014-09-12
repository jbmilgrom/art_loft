class PiecesController < ApplicationController

  def index
  end 

  def create
    #params passes the URL! Figure out why.
    Piece.create({
      url: piece_attributes[:url], 
      user_id: params[:user_id]
    })
    user_id = params[:user_id]
    user = User.find(user_id)
    user.is_artist = true
    user.save

    redirect_to user_path(user_id)
  end

  private

  def piece_attributes
    params.require(:piece).permit(:url)
  end
  
end
