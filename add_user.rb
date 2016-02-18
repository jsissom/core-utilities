#!/usr/bin/ruby

require 'net/http'
require 'json'

if ARGV.length != 1
  puts "Must pass domain as parameter"
  exit 1
end

domain = ARGV[0]
token = File.read(".#{domain}.token")

uri = URI("https://#{domain}.kuali.co/api/v1/users")

header = {
  "Authorization" => "Bearer #{token}",
  "Content-Type" => "application/json",
  "Accept" => "application/json"
}

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.request_uri, header)
request.body = {
  "name" => "Test User",
  "password" => "",
  "username" => "testuser",
  "email" => "testuser@kuali.co",
  "role" => "service",
  "firstName" => "Test",
  "lastName" => "User"
}.to_json

response = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == "https") do |http|
  http.request(request)
end

if response.is_a?(Net::HTTPSuccess)
  jsonStr = response.body
  json = JSON.parse(jsonStr)
  puts JSON.pretty_generate(json)
  exit 0
end

puts response.code
puts response.message
exit 1

