class User < ActiveRecord::Base
	has_many :events, through: :exhibitions
  has_many :exhibitions, through: :pieces
  has_many :pieces

  has_many :venues

    #need to find a way to make the below User.events different that the above
    # has_many :events, through: :rsvps
  has_many :rsvps

  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
    def self.authenticate(email, password)
      user = find_by_email(email)
      if user && user.hashed_password == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
    end
    
    def encrypt_password
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.hashed_password = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end

    #Trying out different notation for class method... 
    #A class which inherits from Self and thus imbeds a method on the class itself. 
  	class << self
  		def artists
  			self.where(is_artist: true)
  		end
  	end
 
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

    # def artist_pieces_by_event
    #    artist_pieces_by_event = []
    #     self.events.uniq.each do |event|
    #       pieces_by_event_array = []
    #       event.pieces.each do |piece|
    #         self.exhibitions.each do |exhibition|
    #             pieces_by_event_array << piece if piece.id == exhibition.piece_id
    #         end       
    #       end
    #       artist_pieces_by_event << pieces_by_event_array if pieces_by_event_array != []
    #     end
    #    artist_pieces_by_event
    # end
      	
end
