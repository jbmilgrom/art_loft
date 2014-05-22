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

venues_url_array = ["http://media.trendland.com/wp-content/uploads/2012/12/industrial-loft-in-barcelona.jpg", "http://trends.archiexpo.com/wp-content/uploads/2014/01/Edmonds-Lee-Oriental-Loft-3.jpg", "http://o.homedsgn.com/wp-content/uploads/2011/02/WG-Loft-01.jpg","http://www.hyattsvillewire.com/wp-content/uploads/2012/06/Firehouse_Lofts_LR__Loft.jpg", "http://cdn.home-designing.com/wp-content/uploads/2013/05/modern-city-loft-6.jpeg", "http://o.homedsgn.com/wp-content/uploads/2011/02/Oriental-Warehouse-Loft-10.jpg"]

faces_url_array = ["http://resources0.news.com.au/images/2009/10/13/1225786/108880-famous-faces-with-braces.jpg", "http://archives.deccanchronicle.com/sites/default/files/styles/article_node_view/public/oprah-winfrey-ap-1308.jpg", "http://2.bp.blogspot.com/-Fhhm-5sChLc/TorJrWWu_LI/AAAAAAAABik/RqjhhZnpxfo/s320/Jackie_Chan_2002-720825.jpg", "http://4.bp.blogspot.com/-ey4J5AJGVIk/TorJpy-fuCI/AAAAAAAABic/U3vyGmp_0aE/s1600/famous_travolta_1_july_2007.jpg", "http://content8.flixster.com/question/67/55/21/6755218_std.jpg", "http://www.healthline.com/hlcmsresource/images/topic_centers/Psoriasis/SS/Famous_Faces/285x285_Famous_Faces_Psoriasis_Slide_8.jpg", "http://cdn7.staztic.com/app/a/2441/2441247/famous-faces-hd-lwp-2-1-s-307x512.jpg", "http://www.redorbit.com/media/uploads/2013/08/famous-face-dementia-617x416.jpg", "http://santamonicaschools.losangelesrealestatevoice.com/files/2013/10/marilyn-monroe.jpg", "http://content6.flixster.com/question/67/55/22/6755228_std.jpg", "http://i.dailymail.co.uk/i/pix/2014/01/24/article-2545209-1BBD255D000005DC-695_306x423.jpg", "http://cdn8.staztic.com/app/a/2342/2342349/famous-faces-live-wallpapers-331973-3-s-307x512.jpg", "http://blog.petspyjamas.com/uploads/2013/11/leo2.jpg", "http://images.smh.com.au/2010/11/09/2034431/cgable-600x400.jpg", "http://cdn8.staztic.com/app/a/2514/2514931/famous-faces-wallpaper-2-3-s-307x512.jpg", "http://cdn8.staztic.com/app/a/2287/2287816/famous-faces-wallpapers-hd-177846-1-s-307x512.jpg", "http://www.glenmuir.com/cms_media/images/justin_timberlake_sports_blue_golf_apparel_for_celebrity_event.jpg", "http://fc05.deviantart.net/fs70/i/2012/140/9/f/jack_nicholson_vector_by_atebitninja-d50hm15.jpg"].uniq




# creates 10 users
i = 0
10.times do 
  	i += 1
    user = User.new({
    f_name: Faker::Name.first_name,
    l_name: Faker::Name.last_name,
    bio: Faker::Lorem.paragraphs(2).join(""),
    email: "user#{i}@gmail.com",
    is_artist: false,
    has_venue: false
    })
    user.password = "password123"
    user.save
end

#creates a User for each sample Venue url in venues_url_array
#creates array of venues for later use
venues = []
i = 0
venues_url_array.each do |venue_url| 
  i += 1
  user = User.new({
    f_name: Faker::Name.first_name,
    l_name: Faker::Name.last_name,
    bio: Faker::Lorem.paragraphs(2).join(""),
    email: "host#{i}@gmail.com",
    is_artist: false,
    has_venue: true,
    profile_pic: faces_url_array[i-1]
    })
  user.password = "password123"
  user.save
  venues << Venue.create({
  	user_id: user.id,
  	address: "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state} #{Faker::Address.zip}",
	url: venue_url
})
end

pieces = []
#creates 4 Users, each with 4/5 Pieces
e = 0
artist_array.each do |artist|
  e += 1
  i += 1
  user = User.new({
    f_name: Faker::Name.first_name,
    l_name: Faker::Name.last_name,
    bio: Faker::Lorem.paragraphs(2).join(""),
    email: "artist#{e}@gmail.com",
    is_artist: true,
    has_venue: false,
    profile_pic: faces_url_array[i]
    })
  user.password = "password123"
  user.save
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
		start_time: "#{rand_month} #{rand_date}, 2014 #{rand_time_1}",
		end_time: "#{rand_month} #{rand_date}, 	2014 #{rand_time_2}",
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







