class RidesController < ApplicationController

    def create
        # binding.pry        
        # ride = Ride.create(ride_params)
        ride = Ride.create(user_id: current_user.id, attraction_id: params[:ride][:attraction_id])
        flash[:notice] = ride.take_ride
        redirect_to user_path(ride.user)
    end

    # private

    # def ride_params
    #     params.require(:ride).permit(:user_id, :attraction_id)
    # end

end
