class RidesController < ApplicationController

    def create
        @ride = Ride.create(ride_params)
        # binding.pry
        if @ride
            @ride_taker = @ride.take_ride
            # binding.pry
            redirect_to user_path(@ride.user, ride_taker: @ride_taker)
        end
    end

    private
    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end