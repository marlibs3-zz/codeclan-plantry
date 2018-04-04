require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/recipe.rb")
require_relative("../models/ingredient.rb")
require('pry')

get '/recipes' do
  @title = "food"
  @recipes = Recipe.all()
  erb ( :"recipes/index" )
end

get '/recipes/new' do
  @ingredients = Ingredient.all()
  erb(:"recipes/new")
end

get '/recipes/:id' do
  @recipe = Recipe.find(params['id'].to_i)
  @ingredients = @recipe.ingredients
  erb ( :"recipes/recipe" )
end

get '/recipes/ingredients/:id' do
  @ingredient = Ingredient.find(params['id'].to_i)
  @title = @ingredient.plural_name.downcase
  @recipes = @ingredient.recipes()
  erb ( :"recipes/index")
end

post '/recipes' do
  recipe = Recipe.new(params)
  recipe.save()
  recipe.add_ingredients_by_id( params['ingredient_array'] )
  redirect to '/recipes'
end
