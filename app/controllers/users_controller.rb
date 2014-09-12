class UsersController < ApplicationController

  def show
    if current_user
      id = current_user.id
      # Don't do id = params[:id] to ensure user authentication 
      @user = User.find(id)
      @new_venue = Venue.new
      @new_piece = Piece.new
    else
      redirect_to root_url, :notice => "Please sign in to see your profile!"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_attributes)
      #@user.save will return certain message/objects/notsure such that it responds to .errors es explicated in new.html.erb in Users views
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end


  def edit
    id = params[:id]
    @user = User.find(id)
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(user_attributes)
    redirect_to user_path
  end

  private

  def user_attributes
    params.require(:user).permit(:f_name, :l_name, :email, :password, :profile_pic, :user_id)
  end

end
