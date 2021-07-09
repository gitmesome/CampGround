class CampgroundsController < ApplicationController
  def index
    render json: Campground.all
  end

  def create
    campground = Campground.create(campground_params)
    render json: campground
  end

  def update
    campground = Campground.find(params[:id])
    campground.update_attributes(campground_params)
    render json: campground
  end

  def destroy
    Campground.destroy(params[:id])
  end

  private 

  def campground_params
    params.require(:campground).permit(:name)
  end
end
