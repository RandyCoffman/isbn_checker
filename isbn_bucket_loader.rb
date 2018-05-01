require 'rubygems'
require 'aws-sdk'
require 'csv'
 
load './local_env.rb' if File.exist?('./local_env.rb')

def connect_to_s3()
client = Aws::S3::Client.new(
    access_key_id: ENV['S3_KEY'],
    secret_access_key: ENV['S3_SECRET'],
    region: ENV['AWS_REGION'],
  )
  file = "results.csv" 
  bucket = 'isbn-validation'
  s3 = Aws::S3::Resource.new(client: client)
  obj = s3.bucket(bucket).object(file)
    File.open('results.csv', 'rb') do |file|
      p file.to_a
      obj.put(body: file)
    end
end


def get_file()
  s3 = Aws::S3::Client.new(
    access_key_id: ENV['S3_KEY'],
    secret_access_key: ENV['S3_SECRET'],
    region: ENV['AWS_REGION'],
  )
  resp = s3.get_object(bucket:'isbn-validation', key:'results.csv')
  isbn_array = []
  isbn = resp.body.read
  isbn = isbn.split().each do |element|
    element.gsub!(/[^0-9a-zA-Z]/, "")
    isbn_array << element
  end
  CSV.open("results.csv", "w") do |csv| 
    csv << isbn_array
  end
end