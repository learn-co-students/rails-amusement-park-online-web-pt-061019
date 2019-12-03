class RidesController < ApplicationController

  def create
    @ride = Ride.new(ride_params)
    if @ride.save
      ride_message = @ride.take_ride
      flash[:message] = ride_message
      redirect_to user_path(@ride.user)
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
