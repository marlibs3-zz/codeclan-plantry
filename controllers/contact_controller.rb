require("sinatra")
require("sinatra/contrib/all")

get '/contact' do
  erb ( :"contact/index" )
end
