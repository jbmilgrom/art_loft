User.delete_all
Piece.delete_all
Exhibition.delete_all
Event.delete_all
Venue.delete_all

warhol_url_array = ["http://upload.wikimedia.org/wikipedia/en/9/95/Warhol-Campbell_Soup-1-screenprint-1968.jpg", "https://www.tate.org.uk/art/images/work/P/P77/P77077_10.jpg", "http://bluesyemre.files.wordpress.com/2013/10/andy-warhol-pop-art-60.jpg", "http://uploads6.wikipaintings.org/images/andy-warhol/mickey.jpg"]

gogh_url_array = ["http://i.huffpost.com/gen/1706828/thumbs/o-56457830-900.jpg?9", "http://www.vangoghexhibition.com/wp-content/themes/vangogh/img/intro_before.med.jpg", "http://www.ibiblio.org/wm/paint/auth/gogh/gogh.chambre-arles.jpg", "http://api.ning.com/files/1cV8U6-KB0UAoXM0EehBgUC0AGk-Nw5Xf94UPwtajp5NCKzbA5qvVMbaDDHoADTfU6YF4aV2G8we-76w9TKoKpHk6sFdqpJuaMLfiZt257M_/van_gogh_terrasse_cafe_l.jpg", "http://upload.wikimedia.org/wikipedia/commons/0/07/Vincent_Van_Gogh_0013.jpg"]

cartier_bresson_url_array = ["http://www.brentalexander.com/blog/wp-content/gallery/henri-cartier-bresson/henri_cartier_bresson_chinese.jpg", "http://mediastore4.magnumphotos.com/CoreXDoc/MAG/Media/Home1/a/6/5/8/PAR43607.jpg" , "http://www.moma.org/images/dynamic_content/exhibition_page/43154.jpg?1374095320", "http://erickimphotography.com/blog/wp-content/uploads/2011/08/henri_cartier_bresson_bicycle.jpg", "http://www.copypasteculture.com/wp-content/uploads/2012/12/Henri-Cartier-Bresson1960.jpeg"]

guston_url_array = ["http://upload.wikimedia.org/wikipedia/en/thumb/d/d6/Gustonphilip.jpg/250px-Gustonphilip.jpg", "http://highendlowlifes.com/cms/wp-content/uploads/2011/07/after-Philip-Guston.jpg", "http://2.bp.blogspot.com/-DPNdqvHtAoY/Twx6VtW10gI/AAAAAAAApJ8/-aPWE7ZEFrs/s1600/LI-aic-PG-001b.jpg", "http://www.haberarts.com/images/G_I/guston.jpg", "http://themodern.org/sites/default/files/guston7.jpg"]

artist_array = [warhol_url_array, gogh_url_array, cartier_bresson_url_array, guston_url_array]

venues_url_array = ["http://media.trendland.com/wp-content/uploads/2012/12/industrial-loft-in-barcelona.jpg", "http://trends.archiexpo.com/wp-content/uploads/2014/01/Edmonds-Lee-Oriental-Loft-3.jpg", "http://o.homedsgn.com/wp-content/uploads/2011/02/WG-Loft-01.jpg","http://www.hyattsvillewire.com/wp-content/uploads/2012/06/Firehouse_Lofts_LR__Loft.jpg", "http://cdn.home-designing.com/wp-content/uploads/2013/05/modern-city-loft-6.jpeg", "http://uploads8.wikipaintings.org/images/philip-guston/deluge.jpg"]




# creates 10 users
10.times do 
  	User.create({
    f_name: Faker::Name.first_name,
    l_name: Faker::Name.last_name,
    bio: Faker::Lorem.paragraphs(2).join(""),
    email: Faker::Internet.email,
    is_artist: false,
    has_venue: false
    })
end

#creates a User for each sample Venue url in venues_url_array
#creates array of venues for later use
venues = []
venues_url_array.each do |venue_url| 
  user = User.create({
    f_name: Faker::Name.first_name,
    l_name: Faker::Name.last_name,
    bio: Faker::Lorem.paragraphs(2).join(""),
    email: Faker::Internet.email,
    is_artist: false,
    has_venue: true
    })
  venues << Venue.create({
  	user_id: user.id,
  	address: "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state} #{Faker::Address.zip}",
	url: venue_url
})
end

pieces = []
#creates 4 Users, each with 4/5 Pieces
artist_array.each do |artist|
  user = User.create({
    f_name: Faker::Name.first_name,
    l_name: Faker::Name.last_name,
    bio: Faker::Lorem.paragraphs(2).join(""),
    email: Faker::Internet.email,
    is_artist: true,
    has_venue: false
    })
  artist.each do |piece_url|
  	pieces << Piece.create({
  	user_id: user.id,
	url: piece_url
	})
  end
end



#create ten events using venues array already set up above
#events = []
# 10.times do
# 	rand_month = month.sample
# 	rand_date = rand(1..28)
# 	rand_time_1 = rand(10..21)
# 	rand_time_2 = rand_time_1 + 3
# 	events << Event.create({
# 		start_time: "#{rand_month} #{rand_date}, 2014 rand_time_1",
# 		end_time: "#{rand_month} #{rand_date}, 2014 rand_time_2",
# 		venue_id: venues.sample.id
# 		})
#end

#creating events which showcase all of one artists work

month = ["January", "Febuary","March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

#creating events which showcase all of one artists work, using venues.sample
User.artists.each do |artist|
	#for each |artist|, create an event to showcase such artist's work
	rand_month = month.sample
	rand_date = rand(1..28)
	rand_time_1 = rand(10..21)
	rand_time_2 = rand_time_1 + 3
	#for each |artist|, create an event to showcase such artist's work
	event = Event.create({
		start_time: "#{rand_month} #{rand_date}, 2014 rand_time_1",
		end_time: "#{rand_month} #{rand_date}, 	2014 rand_time_2",
		venue_id: venues.sample.id,
    title: Faker::Lorem.sentence
	})	
	artist.pieces.each do |piece|
		Exhibition.create({
			event_id: event.id,
			piece_id: piece.id
		})
	end
end







