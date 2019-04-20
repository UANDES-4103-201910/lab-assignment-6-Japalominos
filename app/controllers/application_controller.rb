class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception
  before_action :is_user_logged_in?
    
  def index

  end

  def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      else 
        @current_user = nil
      end
  end

  def is_user_logged_in?
    logged_in = false
  	unless current_user != nil
        logged_in = true 
    
    else
        redirect_to root_path
    end
  end
end
