class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      user.reset_session_token
      session[:session_token] = user.session_token
      flash[:success] = "you logged in"
      redirect_to root_url
    else
      flash[:error] = "invalid login"
      render new_sessions_path
    end
  end

  def new
  end

  def destroy
    session[:session_token] = nil
    redirect_to root_url
  end

end