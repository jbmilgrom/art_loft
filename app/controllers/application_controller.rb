class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception

   	helper_method :current_user

	 private

	#the session hash receives the key value pair of {:user_id => id_of_a_user} when a user signs up through (i) the '/sign_up' get request and (ii) the '/log_in' get request.
	#the "session" is only destroyed (i.e session[:user_id] = nil) when the user sends the get request '/log_out'
	#calling current_user in any descendent controller returns a User instance unless the key value pair of {:user_id => id_of_a_user} has yet to be introduced into the session hash.  
	#Such k,v pair gets introduced through either
	#note that the 'session' hash persists through multiple http requests, which is the whole point!
	def current_user
		#the "if session" clause is all about error handling
  		(@current_user ||= User.find(session[:user_id]) ) if session[:user_id]
	end
end
