require("sinatra")
require('sinatra/contrib/all') if development?
require_relative("../models/ingredient.rb")

get '/ingredients' do
  @ingredients = Ingredient.all()
  erb ( :"ingredients/index" )
end

get '/ingredients/:id' do
  @ingredients = Ingredient.find(params['id'].to_i)
  erb ( :"ingredients/index" )
end
