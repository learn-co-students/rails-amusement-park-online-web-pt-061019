class RidesController < ApplicationController
    def go_on
        @attraction = Attraction.find_by(id: params[:attraction_id])
        @user = User.find_by(id: params[:user_id])
        @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
        flash[:message] = @ride.take_ride
        redirect_to user_path(@user)
    end
end