class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
  end
end
