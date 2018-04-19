require "sinatra"
require_relative "isbn-validation.rb"

enable :sessions

get "/" do
	erb :page1_name_entry
end

post "/post-name" do
	redirect "/"
end