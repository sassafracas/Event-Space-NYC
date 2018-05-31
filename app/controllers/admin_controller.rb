class AdminController < ApplicationController

  def new
    if current_user.name == "admin"

    else
      redirect_to home_path
    end
  end


  def events
    # binding.pry

    if current_user.user_name == "admin"
      @user = current_user
      @events = Event.all
    else
      redirect_to home_path
    end

  end

  def users
    if current_user.name == "admin"

    else
      redirect_to home_path
    end

  end


  def remove

  end

  def delete
    binding.pry
    params
  end

  def destroy
    # binding.pry
    event = Event.find(params["event_id"])
    event.destroy
    redirect_to admin_events_path
  end
end
