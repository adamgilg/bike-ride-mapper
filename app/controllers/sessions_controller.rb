class SessionsController < ApplicationController
  end

  def create
    user = User.find(params[:email])
    user.session_token #= something
  end
end