require("sinatra")
require("sinatra/contrib/all")

get '/specification' do
  erb ( :"specification/index" )
end
