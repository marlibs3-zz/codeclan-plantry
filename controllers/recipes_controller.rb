require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/recipe.rb")
require('pry')

get '/recipes' do
  @title = "Browse all our recipes..."
  @recipes = Recipe.all()
  erb ( :"recipes/index" )
end

get '/recipes/:id' do
  @recipe = Recipe.find(params['id'].to_i)
  erb ( :"recipes/recipe" )
end

get '/recipes/ingredients/:id' do
  @ingredient = Ingredient.find(params['id'].to_i)
  @title = @ingredient.plural_name.downcase
  @recipes = @ingredient.recipes()
  erb ( :"recipes/index")
end
