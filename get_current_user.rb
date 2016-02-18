#!/usr/bin/ruby

require 'net/http'
require 'json'

if ARGV.length != 1
  puts "Must pass domain as parameter"
  exit 1
end

domain = ARGV[0]
token = File.read(".#{domain}.token")

uri = URI("https://#{domain}.kuali.co/api/v1/users/current")

request = Net::HTTP::Get.new(uri)
request['Authorization'] = "Bearer #{token}"

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

