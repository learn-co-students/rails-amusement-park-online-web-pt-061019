class RidesController < ApplicationController

  def new
    @ride = Ride.new
  end

  def create
    @user = User.find_by_id(params[:ride][:user_id])
    @ride = Ride.create(attraction_id: params[:ride][:attraction_id], user_id: params[:ride][:user_id])
    message = @ride.take_ride
    redirect_to user_path(@user), flash: { message: message }
  end
  
end
