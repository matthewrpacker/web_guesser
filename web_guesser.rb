require 'sinatra'
require 'sinatra/reloader'

random_num = rand(100)
get '/' do
  erb :index, :locals => {:number => random_num}
end
