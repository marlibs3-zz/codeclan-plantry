require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/recipe_controller')
require_relative('controllers/about_controller')
require_relative('controllers/contact_controller')

get '/' do
  erb( :index )
end
