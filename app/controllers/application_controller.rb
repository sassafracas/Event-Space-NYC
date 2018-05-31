class ApplicationController < ActionController::Base
require 'pry'
@@search_results = []

helper_method :current_user, :logged_in?, :empty_search


  def empty_search
    while @@search_results.count >0
      @@search_results.pop
    end
  end

  def current_user

    if session[:user_id]
        User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path if  !logged_in?
  end


end
