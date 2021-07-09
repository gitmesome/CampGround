class CampsitesController < ApplicationController
  def index
    render json: Campsite.all
  end

  def create
    campsite = Campsite.create(campsite_params)
    render json: campsite
  end

  def update
    campsite = Campsite.find(params[:id])
    campsite.update_attributes(campsite_params)
    render json: campsite
  end

  def destroy
    Campsite.destroy(params[:id])
  end

  private 

  def campsite_params
    params.require(:campsite).permit(:name, :booked_date, :price)
  end
end
