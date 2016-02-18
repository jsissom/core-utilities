#!/usr/bin/ruby

require 'net/http'
require 'json'

if ARGV.length != 2
  puts "Must pass domain then user id as parameter"
  exit 1
end

domain = ARGV[0]
token = File.read(".#{domain}.token")

id = ARGV[1]

uri = URI("https://#{domain}.kuali.co/api/v1/users/#{id}")

request = Net::HTTP::Delete.new(uri)
request['Authorization'] = "Bearer #{token}"

response = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == "https") do |http|
  http.request(request)
end

if response.is_a?(Net::HTTPSuccess)
  puts "Deleted"
  exit 0
end

puts response.code
puts response.message
exit 1

