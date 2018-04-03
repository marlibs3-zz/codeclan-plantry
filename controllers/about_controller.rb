require("sinatra")
require("sinatra/contrib/all")

get '/about' do
  erb ( :"about/index" )
end
