class Event < ActiveRecord::Base
	belongs_to :venue
	#purposely ommiting link to user through venue to avoid name-spacing issue with has_many :users.
	#as a result, I will need to call Event.venue.user directly

	has_many :users, through: :pieces
	has_many :pieces, through: :exhibitions
	has_many :exhibitions

	# Need to write equivelant of has_many :users, through: :rsvps
	has_many :rsvps

	def artists
		self.users.uniq
	end

	def host
		self.venue.user
	end

	# This method organizes all of the pieces of a given event such that each set of the values in the resulting array is tied to a given artist
	# This may be contrasted with event.pieces, which returns all of the pieces of a given event, each its own entry in the returned array - which is not in anyway organized by artist.  
	# There is no issue with event.pieces until more than one artist showcases work at a given event.
	# So this method is meant to be able to handle the situation in which the work of more than one artist is showcased at a given event.
	# Active record does not provide a method for this type of organization out of the box.
	def pieces_by_artist
	 pieces_by_artist = []
		#iterate over each user that has an exhibition at this event
		self.users.uniq.each do |user|
			an_artists_pieces = []
			#a user may have pieces not being showcased at this particular event, so...
			#select a user's piece if associated with any of this event's exhibitions
			user.pieces.each do |piece|
				self.exhibitions.each do |exhibition|
				 		an_artists_pieces << piece if piece.id == exhibition.piece_id
				end				
			end
			#push array of peices (now) associated with a single user into array wrapper
			pieces_by_artist << an_artists_pieces 
		end
	 pieces_by_artist
	end
	
	def start_date
		self.start_time.strftime("%B %-d, %Y")
	end
	def start_hour
		self.start_time.strftime("%-I:%M %p")
	end

	def end_date
		self.end_time.strftime("%B %-d, %Y")
	end
	def end_hour
		self.end_time.strftime("%-I:%M %p")
	end

end
