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

require 'json'

def get_token(domain)
  domain_file = ".#{domain}.token"
  raise "unknown domain: #{domain}" unless File.exist?(domain_file)
  File.read(domain_file)
end

def read_json_file(filename)
  raise "unknown file: #{filename}" unless File.exist?(filename)
  File.read(filename)
end

