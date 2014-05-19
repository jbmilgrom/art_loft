class Piece < ActiveRecord::Base
	belongs_to :user

	has_many :events, through: :exhibitions
  	has_many :exhibitions

  # def self.create(user_id, url)
  #     self.create({
  #       user_id: user_id, 
  #       url: url 
  #       })
  #     User.find(user_id).is_artist = true
  # end





  
  # 	 def add_portion(quantity, unit_name, ingredient_name)
  #   #
  #   ingredient = Ingredient.find_by_name(ingredient_name)

  #   # if ingredient is found...
  #   if ingredient
  #     # get this instance of recipe's own portions
  #     self.portions << Portion.create({
  #       quantity: quantity,
  #       unit: unit_name,
  #       ingredient: ingredient
  #       })
  #   else
  #     # shows this in server log
  #     puts "Failed to create recipe! No ingredient with name #{ingredient_name}"
  #     nil
  #   end
  # end

# end

end