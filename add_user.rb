#!/usr/bin/ruby

# Copyright 2016 Kuali
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'net/http'
require 'json'
require_relative './core_utils.rb'

if ARGV.length != 2
  puts "add_user.rb domain user_json_file\n"
  puts "  domain = core domain"
  puts "  user_json_file = file name of file containing user data formatted as json"
  exit 1
end

begin
  domain = ARGV[0]
  token = get_token(domain)
  user_json = read_json_file(ARGV[1])

  uri = URI("https://#{domain}.kuali.co/api/v1/users")

  header = {
    "Authorization" => "Bearer #{token}",
    "Content-Type" => "application/json",
    "Accept" => "application/json"
  }

  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.request_uri, header)
  request.body = user_json

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
rescue  => error
  puts error
  exit 1
end

