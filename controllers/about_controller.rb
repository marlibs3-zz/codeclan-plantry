require("sinatra")
require('sinatra/contrib/all') if development?

get '/about' do
  erb ( :"about/index" )
end
