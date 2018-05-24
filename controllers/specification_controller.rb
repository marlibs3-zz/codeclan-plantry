require("sinatra")
require('sinatra/contrib/all') if development?

get '/specification' do
  erb ( :"specification/index" )
end
