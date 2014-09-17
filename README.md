# ArtLoft

Connecting residences with artists looking to showcase work 

![image](https://s3-us-west-2.amazonaws.com/leafpics/portfolio_page/artloft/one.png)

## Technical Specs

* Framework: `rails`, `4.1.1`
* Entity relational diagram:  
`|User| --< |Piece| --< |Exhibition| >-- |Event| >-- |Venue| >-- |User|`
* A single User of the application can wear 1, 2 or 3 hats, in any combination: 1. Guest; 2. Host; 3. Artist. This is managed through two booleans in the User model, :is_artist? and :has_venue?, set to False by default. For instance, a User's private profile (show.html.erb) displays different information to such User depending on the value of each boolean.
* ArtistsController and HostsController handle RESTful routing to such resources
* `gem "bcrypt"` for encryption


