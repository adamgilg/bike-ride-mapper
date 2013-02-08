class SessionsController < ApplicationController
  end

  def create
    user = User.find_by_email(params[:email])
    user.session_token #= something
  end
end