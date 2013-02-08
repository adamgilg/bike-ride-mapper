class ApplicationController < ActionController::Base
  protect_from_forgery


  def require_login

  end

  def logged_in?
  end

  def current_user
    unless session[:token].nil?
      @current_user = User.find_by_session_token(session[:token])
    else
      nil
    end
  end


end
