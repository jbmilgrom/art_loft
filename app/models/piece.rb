class Piece < ActiveRecord::Base
  belongs_to :user

  has_many :events, through: :exhibitions
  has_many :exhibitions

  # def self.create(user_id, url)
  #   self.create({
  #     user_id: user_id, 
  #     url: url 
  #   })
  #   User.find(user_id).is_artist = true
  # end

end
