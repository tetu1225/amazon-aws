require 'rubygems'
require 'sinatra'
require 'amazon/aws/search'
require 'haml'
require 'sass'

include Amazon::AWS
include Amazon::AWS::Search

get '/' do
	@var = "Hello Haml!"
	haml :index
end

get '/item_search/:keywords' do
	is = ItemSearch.new('Books', {'Keywords' => params[:keywords]})
	is.response_group = ResponseGroup.new('Medium')
	
	req = Request.new
	req.locale = 'jp'
	
	response = req.search(is)
	@items = response.item_search_response[0].items[0].item
	haml :item_search
end