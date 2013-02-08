class RidesController < ApplicationController

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(params[:ride])
    # flash[:notice] = [] if flash[:notice].nil?
    if @ride.save
      flash[:success] = "keep pedaling! your ride was saved."
      redirect_to root_path
    else
      flash[:error] = "stop pedaling - your ride was missing something"
      render :new
    end
  end

  def index
    @rides = Ride.all
  end

  def show
  end
end