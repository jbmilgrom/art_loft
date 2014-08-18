class EventsController < ApplicationController

  def index
    @events = Event.order(:start_time)
  end 

  def show 
    id = params[:id]
    @event = Event.find(id)
    @host = @event.host
    @artists = @event.artists
  end

  def new
    @event = Event.new
  end

  private

  def user_attributes
    params.require(:event).permit(:f_name, :l_name, :email, :password, :profile_pic, :user_id)
  end

end
