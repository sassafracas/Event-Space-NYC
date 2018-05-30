require 'rest-client'
require 'json'
require 'net/http'
require 'active_support'
require 'active_support/core_ext'
require 'pry'


def parse_api(link)
  data ={}
  raw_data = RestClient.get(link)
  data = JSON.parse(raw_data)
  # binding.pry
end


def nyartbeat_parse(geo , free=1)
  link = "http://www.nyartbeat.com/list/event_searchNear?latitude=#{geo['lat']}&longitude=#{geo['lng']}&SearchRange=3000m&MaxResults=10&SortOrder=distance&free=#{free}"
  s = Net::HTTP.get_response(URI.parse(link)).body
  # binding.pry
  data = JSON.parse(Hash.from_xml(s).to_json)
end

def address_to_geo(address)
  geo= {}
  geo['lat'] = 40.7319579
  geo['lng'] = -73.9768964
  byebug
  link = 'https://maps.googleapis.com/maps/api/geocode/json?address='
  key= '&key=AIzaSyB8y9s45xVG7OAhCdYa14p80sQBEiKEgV8'
  address = address.gsub(' ', '+')
  link = link + address + key
  data = parse_api(link)
  # binding.pry
  if data['results'].count > 0
    data['results'][0]['geometry']['location']
  else
    geo
  end
end

def geo_to_address(geo)
  link = 'https://maps.googleapis.com/maps/api/geocode/json?latlng='
  key= '&key=AIzaSyB8y9s45xVG7OAhCdYa14p80sQBEiKEgV8'
  link = link + geo['lat'].to_s + ","+ geo['lng'].to_s + key
  data = parse_api(link)
  data["results"][0]["formatted_address"]
end

def geo_to_neighborhood(geo)
  link = 'https://maps.googleapis.com/maps/api/geocode/json?latlng='
  key= '&key=AIzaSyB8y9s45xVG7OAhCdYa14p80sQBEiKEgV8'
  link = link + geo['lat'].to_s + ","+ geo['lng'].to_s + key
  data = parse_api(link)
  n=data["results"][0]["address_components"].select{|c| c.values.flatten.include?("neighborhood")}
  # binding.pry
  n[0]["long_name"]
end

geo= {}
geo['lat'] = 40.7319579
geo['lng'] = -73.9768964
puts geo_to_address(geo)
puts geo_to_neighborhood(geo)

y = address_to_geo("18 Stuyvesant Oval, new york, new york")
puts y
# puts nyartbeat_parse(y, 0)
