class UsersController < ApplicationController

	def show
		id = params[:id]
		@user = User.find(id)
	end

	def new
  		@user = User.new
	end

	def create
  		@user = User.new(user_attributes)
  		if @user.save
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