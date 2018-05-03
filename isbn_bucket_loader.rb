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
      obj.put(body: file)
    end
end

def connect_to_s3_2()
client = Aws::S3::Client.new(
    access_key_id: ENV['S3_KEY'],
    secret_access_key: ENV['S3_SECRET'],
    region: ENV['AWS_REGION'],
  )
  file = "new_results.csv" 
  bucket = 'isbn-validation'
  s3 = Aws::S3::Resource.new(client: client)
  obj = s3.bucket(bucket).object(file)
    File.open('new_results.csv', 'rb') do |file|
      obj.put(body: file)
    end
end