require 'rubygems'
require 'sinatra'
require 'amazon/aws'
require 'haml'

get '/' do
	@var = "Hello Haml!"
	haml :index
end

get '/item_search' do
	haml :item_search
end