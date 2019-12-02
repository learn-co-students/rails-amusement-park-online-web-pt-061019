class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
        @user = User.find_by(params[:id])
    end

    def show
        @attraction = Attraction.find(params[:id])
        # binding.pry
        @ride = @attraction.rides.build(user_id: current_user.id)
        # binding.pry
    end

    def new
        @attraction = Attraction.new
    end

    def create
        
    end
end
