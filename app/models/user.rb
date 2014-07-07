class User < ActiveRecord::Base
	has_many :events, through: :exhibitions
  has_many :exhibitions, through: :pieces
  has_many :pieces

  has_many :venues

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

  #Trying out different notation for class methods... 
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
    	
end
