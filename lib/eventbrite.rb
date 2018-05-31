# require 'faraday'
# require 'base64'
# require 'json'
# require "pry"
#
# latitude = '40.77493'
# longitude = '-74.419415'
# api_key = 'TVBPW6RABWSC73XMYW5Y'
# max = '3'
# date = 'This week'
# city = "New York City"
# within = '10013'
#
# urlencoded = URI.encode_www_form({'app_key' => api_key, 'within' => '10013', 'latitude' => latitude, 'longitude' => longitude, 'max' => '3', 'date' => date})
#
# url = "https://www.eventbriteapi.com/v3/event/search/subcategories/10003/?token=TVBPW6RABWSC73XMYW5Y&location.within=10013"
#
# https://www.eventbriteapi.com/v3/events/search/?token=TVBPW6RABWSC73XMYW5Y&start_date.keyword=next_week&expand=venue&location.latitude=40.9353537&location.longitude=-74.8405065&location.within=110km
# https://www.eventbriteapi.com/v3/events/search/?location.address=NYC&location.within=100km&subcategories=10003&token=TVBPW6RABWSC73XMYW5Y
#
# def parse_api(link)
#   data ={}
#   raw_data = RestClient.get(link)
#   data = JSON.parse(raw_data)
#   # binding.pry
# end
#
#
# events = parse_api(url)
#
# binding.pry
# events.each do |event|
#   if event.first.first == 'event'
#     title = event['event']['title']
#     if event['event']['venue'] == nil
#       venue = ""
#       address = ""
#       city = ""
#       region = ""
#       postal_code = ""
#       latitude = ""
#       longitude = ""
#     else
#       venue = event['event']['venue']['name']
#       address = event['event']['venue']['address']
#       city = event['event']['venue']['city']
#       region = event['event']['venue']['region']
#       postal_code = event['event']['venue']['postal_code']
#       latitude = event['event']['venue']['latitude']
#       longitude = event['event']['venue']['longitude']
#     end
#     category = event['event']['category']
#     start_date = event['event']['start_date']
#     end_date = event['event']['end_date']
#     price = event['event']['tickets'].first['ticket']['price']
#
#     p "Event:      #{title}"
#     p "Venue:      #{venue}"
#     p "Category:   #{category}"
#     p "Start Date: #{start_date}"
#     p "End Date:   #{end_date}"
#     p "Price:      $#{price}"
#     p "Address:    #{address}, #{city}, #{region}, #{postal_code}"
#     p "Latitude:   #{latitude}"
#     p "Longitude:  #{longitude}"
#
#     puts "\n"
#   end
# end
