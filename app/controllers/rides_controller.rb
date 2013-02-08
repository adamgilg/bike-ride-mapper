class RidesController < ApplicationController

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(params[:ride])
    if @ride.save
      flash[:success] = "keep pedaling! everything is a-okay."
      redirect_to root_path
    else
      flash[:error] = "stop pedaling - we've got a problem."
      render :new
    end
  end

  def show
  end
end