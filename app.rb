require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/ingredients_controller')
require_relative('controllers/recipes_controller')
require_relative('controllers/recipe_ingredients_controller')

get '/' do
  erb( :index )
end
