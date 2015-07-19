class ParksController < ApplicationController
  def index
    if params[:search].present?
      parks = Park.near(params[:search], 5)
      park_markers(parks)
      locals parks: parks
    else
      parks = Park.all
      park_markers(parks)
      locals parks: parks
    end
  end

  def show
    @park = Park.find(params[:id])
  end

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)
    if @park.save
      redirect_to @park, notice: "Successfully created park."
    else
      render :action => 'new'
    end
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    @park = Park.find(params[:id])
    if @park.update_attributes(park_params)
      redirect_to @park, notice: "Successfully updated park."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @park = Park.find(params[:id])
    @park.destroy
    redirect_to parks_url, notice: "Successfully destroyed park."
  end

  private

  def park_params
    params.require(:park).permit(:address, :latitude, :longitude)
  end

  def park_markers(parks)
    @hash = Gmaps4rails.build_markers(parks) do |park, marker|
      marker.lat park.latitude
      marker.lng park.longitude
    end
  end

end
