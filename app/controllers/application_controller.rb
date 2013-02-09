class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user

  def require_login
    unless logged_in?
      flash[:error] = "not logged in"
      redirect_to root_path
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    unless session[:session_token].nil?
      @current_user = User.find_by_session_token(session[:session_token])
    else
      nil
    end
  end


end



