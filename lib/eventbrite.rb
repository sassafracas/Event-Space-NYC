require 'faraday'
require 'RestClient'
require 'base64'
require 'json'
require "pry"




# url = "https://www.eventbriteapi.com/v3/event/search/subcategories/10003/?token=TVBPW6RABWSC73XMYW5Y&location.within=10013"

# https://www.eventbriteapi.com/v3/events/search/?token=TVBPW6RABWSC73XMYW5Y&start_date.keyword=next_week&expand=venue&location.latitude=40.9353537&location.longitude=-74.8405065&location.within=110km

def parse_api(link)
  data ={}
  raw_data = RestClient.get(link)
  data = JSON.parse(raw_data)
  # binding.pry
end
