class UsersController < ApplicationController
  before_action :get_user, only:[:show, :edit, :update, :destroy, :save]
  before_action :authorized, only: [:edit]
  def home

  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to signup_path
    end
  end

  def show

  end

  def edit


  end

  def update
    @user = User.update(user_params)
    if @user.valid?
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  def destroy
    # byebug
    event = @user.events.find(params[:event_id])

    if event
      @user.events.delete(event)
      redirect_to @user
    end
  end

  def save
    # byebug
    if params["event_id"] != nil
      @event = @@search_results[params["event_id"].to_i]
      @event.save
    else
      @event = Event.find(params["database_event_id"].to_i)
    end
    if !@user.events.include?(@event)
      @user.events << @event
    end

    redirect_to @user
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name, :full_name, :email, :password)
  end

   def event_params
     # byebug
     event={}
     event["title"] = params["title"]
     event["address"] = params["address"]
     event["description"] = params["description"]
     geo = address_to_geo(event['address'])
     event["location"] = Location.find_or_create_by(latitude:geo['lat'],longitude:geo['lng'],neighborhood:geo_to_neighborhood(geo))
     event["category"] = Category.find_by(name:"Art")
     # params.require(:user).permit(:title, :venue_name, :address, :description)
     event
   end
end
