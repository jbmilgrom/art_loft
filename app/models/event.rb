class Event < ActiveRecord::Base
	belongs_to :venue
	#purposely ommiting link to user through venue.
	#as a result, I will need to call Event.venue.user
	#as such i.e. directly

	has_many :users, through: :pieces
	has_many :pieces, through: :exhibitions
	has_many :exhibitions

	#write function to find users (like below) that doesn't conlflict with the function above (unlike below)
	# has_many :users, through: :rsvps
	has_many :rsvps

end
