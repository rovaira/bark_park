class ParksController < ApplicationController
  def index
    if params[:search].present?
      @parks = Park.near(params[:search], 50, order: 'distance')
    else
      @parks = Park.all
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
      redirect_to @park, :notice => "Successfully created park."
    else
      render :action => 'new'
    end
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    @park = Park.find(params[:id])
    if @park.update_attributes(params[:park])
      redirect_to @park, :notice  => "Successfully updated park."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @park = Park.find(params[:id])
    @park.destroy
    redirect_to parks_url, :notice => "Successfully destroyed park."
  end

  private

  def park_params
    params.require(:park).permit(:address, :latitude, :longitude)
  end
end