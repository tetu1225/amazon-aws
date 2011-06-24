require 'rubygems'
require 'sinatra'
require 'amazon/aws'
require 'haml'

get '/' do
	@var = "Hello Haml!"
	haml :index
end