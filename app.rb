require("sinatra")
require("sinatra/contrib/all")
require_relative("models/ingredient.rb")
require_relative("models/recipe.rb")
require_relative("controllers/recipes_controller")
require_relative("controllers/about_controller")
require_relative("controllers/contact_controller")

get '/' do
  @ingredients = Ingredient.all()
  erb( :index )
end
