require 'rest-client'
require 'json'



def parse_api(link)
  data ={}
  raw_data = RestClient.get(link)
  data = JSON.parse(drink_url_link)
  # binding.pry
end


def test
  link = "http://www.nyartbeat.com/list/event_searchNear?latitude=40.719130&longitude=-73.980000&MaxResults=5&SortOrder=distance&free=1"

  data= parse_api(link)

end

test
