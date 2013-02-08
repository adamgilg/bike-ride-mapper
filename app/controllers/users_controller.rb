class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    photo = params[:user].delete(:photo)
    @user = User.new(params[:user])
    @user.photo_blob = photo.read
    @user.save!

    redirect_to root_url
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def photo
    user = User.find(params[:id])
    send_data(user.photo_blob, type: 'image/jpg', disposition: 'inline')
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end
end