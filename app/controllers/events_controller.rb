require "./lib/api_parse"

class EventsController < ApplicationController
  before_action :get_event, only: [:show]
  def index
    @events = Event.all
  end

  def search
  end

  def results
    @user = current_user
    y = address_to_geo(params[:search])
    data = nyartbeat_parse(y, 0)
    @events = data["Events"]["Event"]
  end

  private

  def get_event
    @event = Event.find(params[:id])
  end
end
