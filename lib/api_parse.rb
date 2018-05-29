require 'rest-client'
require 'json'
require 'net/http'
require 'active_support'
require 'active_support/core_ext'
require 'pry'


def parse_api(link)
  data ={}
  raw_data = RestClient.get(link)
  data = JSON.parse(drink_url_link)
  # binding.pry
end


def nyartbeat_parse(link)
  link = "http://www.nyartbeat.com/list/event_searchNear?latitude=40.719130&longitude=-73.980000&MaxResults=5&SortOrder=distance&free=1"
  s = Net::HTTP.get_response(URI.parse(link)).body
  # binding.pry
  data = JSON.parse(Hash.from_xml(s).to_json)
end

test
