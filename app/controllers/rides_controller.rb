class RidesController < ApplicationController

    # def new
    #     @ride = Ride.new
    # end

    def create
        # binding.pry
        
        # ride = Ride.create(ride_params)
        ride = Ride.create(user_id: current_user.id, attraction_id: params[:ride][:attraction_id])
        flash[:notice] = ride.take_ride
        # @ride.save
        redirect_to user_path(ride.user)
    end

    # private

    # def ride_params
    #     params.require(:ride).permit(:user_id, :attraction_id)
    # end

end
