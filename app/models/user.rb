class User < ActiveRecord::Base
	

	has_many :events, through: :exhibitions
  	has_many :exhibitions, through: :pieces
  	has_many :pieces

  	has_many :venues

  	#need to find a way to make the below User.events different that the above
  	# has_many :events, through: :rsvps
  	has_many :rsvps

  	class << self
  		def artists
  			self.where(is_artist: true)
  		end
  	end
  	#alternate syntax for above class method
  	# def self.artists
  	# 	self.where(is_artist: true) 
  	# end
  	class << self
  		def hosts
  			self.where(has_venue: true)
  		end
  	end

    def events_hosted
      events = []
      self.venues.each do |venue|
        event_array_wrapper = []
        event_array_wrapper << venue.events if venue.events != []
        event_array_wrapper.each do |event_array|
          event_array.each do |event|
            events << event
          end
        end
      end
      return events
    end

  	
end
