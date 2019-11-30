class RidesController < ApplicationController

  def new
    @ride = Ride.new
  end

  def create
    # {"utf8"=>"✓", "authenticity_token"=>"/zDWIzxi0OW08hXwUFjEXYPzzm7EbstOwv0stn61X3vGNnqNuqK+Lf3xf1iUaW90jiHK9iPVReYXhCthg2RJWQ==", "ride"=>{"attraction_id"=>"", "user_id"=>""}, "commit"=>"Go on this ride", "controller"=>"rides", "action"=>"create"}
    # raise params.inspect
    @user = User.find_by_id(params[:ride][:id])
    @ride = Ride.create(attraction_id: params[:ride][:attraction_id], user_id: params[:ride][:id])
    redirect_to user_path(@user)
  end

  def take_ride

  end
end
