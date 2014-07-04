class Event < ActiveRecord::Base
	belongs_to :venue
	#purposely ommiting link to user through venue.
	#as a result, I will need to call Event.venue.user as such i.e directly

	has_many :users, through: :pieces
	has_many :pieces, through: :exhibitions
	has_many :exhibitions

	#write function to find users (like below) that doesn't conlflict with the function above (unlike below)
	# has_many :users, through: :rsvps
	has_many :rsvps

	def artists
		self.users.uniq
	end

	def host
		self.venue.user
	end

	#this function organizes all of the pieces of a given event such that each set of the values in the resulting array is limited to a given artist
	#this should be contrasted with event.pieces, which returns all of the pieces of a given event, each its own entry in the returned array - which is not in anyway organized by artists.

	def pieces_by_artist
	 pieces_by_artist = []
		self.users.uniq.each do |user|
			artist_array = []
			user.pieces.each do |piece|
				self.exhibitions.each do |exhibition|
				 		artist_array << piece if piece.id == exhibition.piece_id
				end				
			end
			pieces_by_artist << artist_array if artist_array != []
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
