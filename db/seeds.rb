require_relative("../models/ingredient.rb")
require_relative("../models/recipe.rb")
require_relative("../models/recipe_ingredient.rb")
# require("pry-byebug")

Recipe_Ingredient.delete_all()
Ingredient.delete_all()
Recipe.delete_all()
