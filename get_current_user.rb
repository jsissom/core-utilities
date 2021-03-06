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

if ARGV.length != 1
  puts "current_user.rb domain\n"
  puts "  domain = core domain"
  exit 1
end

begin
  domain = ARGV[0]
  token = get_token(domain)

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
rescue => error
  puts error
  exit 1
end

