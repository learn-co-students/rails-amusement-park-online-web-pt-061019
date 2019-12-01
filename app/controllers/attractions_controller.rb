class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
        @user = User.find_by(params[:id])
    end

    def show
        @attraction =Attraction.find_by(params[:name])
    end

    def new
        @attraction = Attraction.new
    end

    def create
        
    end
end
