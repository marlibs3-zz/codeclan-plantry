require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/recipe.rb")

get '/recipes' do
  @recipes = Recipe.all()
  erb ( :"recipes/index" )
end

get '/recipes/:id' do
  @recipes = Recipe.find(params['id'].to_i)
  erb ( :"recipes/index" )
end
