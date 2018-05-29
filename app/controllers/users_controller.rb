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

  end

  def save
    @event = Event.create(event_params)
    byebug
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name, :full_name, :email, :password)
  end

   def event_params
     byebug
     params.require(:user).permit(:title, :venue_name, :address, :description)
   end
end
