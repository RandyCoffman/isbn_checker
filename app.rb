require 'sinatra'
require 'csv'
require 'aws-sdk'
require_relative 'isbn_validation.rb'
require_relative 'isbn_bucket_loader.rb'

load './local_env.rb' if File.exist?('./local_env.rb')

enable :sessions

get "/" do
	erb :page1_name_entry
end

post "/post-name" do
	session[:first_name] = params[:first_name]
	session[:last_name] = params[:last_name]
	redirect "/input_isbn"
end

get "/input_isbn" do
	first_name = session[:first_name]
	last_name = session[:last_name]
	erb :page2_input_isbn, locals:{first_name:first_name, last_name:last_name}
end

post "/post-number" do
	session[:numbers] = params[:numbers]
	redirect "/results"
end

get "/results" do
	first_name = session[:first_name]
	last_name = session[:last_name]
	my_numbers = []
	numbers = session[:numbers] 
	validation = isbn10_or_isbn13(numbers)
	erb :page3_results, locals:{numbers:numbers, validation:validation, first_name:first_name, last_name:last_name}
end

post "/post-results" do
	redirect "/finalize"
end

get "/finalize" do
	connect = connect_to_s3
	connect
	first_name = session[:first_name]
	last_name = session[:last_name]
	erb :page4_display_your_results, locals:{first_name:first_name, last_name:last_name}
end