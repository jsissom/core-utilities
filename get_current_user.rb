#!/usr/bin/ruby

# Copyright (C) 2016 Kuali

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, and only version 2.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

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

