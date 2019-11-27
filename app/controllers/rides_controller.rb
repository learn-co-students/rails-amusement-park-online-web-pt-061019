class RidesController < ApplicationController
  before_action :set_ride, only: [:show, :edit, :update, :destroy]

  def index
    @rides = Ride.all
  end

  def show
  end

  def new
    @ride = Ride.new
  end

  def edit
  end

  def create
    @ride = Ride.new(user_id: current_user.id, attraction_id: params[:attraction_id])
    if @ride.save
      if @ride.user.admin
        redirect_to attraction_path(@ride.attraction)
      else
        redirect_to user_path(current_user), notice:@ride.take_ride
      end
      else
        redirect_to attraction_path(attraction), notice: "#{@ride.attraction.name} was not ridden."
    end
  end

  def update
    @ride = Ride.find_by_id(params[:id])
    if @ride.update(ride_params)
      redirect_to ride_path(@ride)
    else
      render :edit
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:name, :user_id, :attraction_id)
  end

  def set_ride
    @ride = Ride.find_by_id(params[:id])
  end
end
