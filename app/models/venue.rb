class Venue < ActiveRecord::Base
	belongs_to :user
	has_many :events

	# def self.create(user_id, address, name=nil, url)
 #      self.create({
 #        user_id: user_id, 
 #        address: address,
 #        name: name,
 #        url: url 
 #        })
 #      User.find(user_id).has_venue = true
 #  	end

end
