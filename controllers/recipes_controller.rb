require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/recipe.rb")
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
  erb ( :"recipes/recipe" )
end

get '/recipes/ingredients/:id' do
  @ingredient = Ingredient.find(params['id'].to_i)
  @title = @ingredient.plural_name.downcase
  @recipes = @ingredient.recipes()
  erb ( :"recipes/index")
end

post '/recipes' do
  Recipe.new(params).save
  redirect to '/recipes'
end
