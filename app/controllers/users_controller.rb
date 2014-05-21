class UsersController < ApplicationController

	def show
		if current_user
			id = current_user.id
			@user = User.find(id)
			@new_venue = Venue.new
		else
			redirect_to root_url, :notice => "Please sign in to see your profile!"
		end
	end

	def new
  		@user = User.new
	end

	def create
  		@user = User.new(user_attributes)
  		if @user.save
  			session[:user_id] = @user.id
    		redirect_to root_url, :notice => "Signed up!"
  		else
    		render "new"
  		end
	end

	private

  	def user_attributes
    	params.require(:user).permit(:f_name, :l_name, :email, :password, :user_id)
  	end

end