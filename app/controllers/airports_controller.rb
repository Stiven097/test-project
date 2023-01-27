class AirportsController < ApplicationController

  before_action :set_airport, only: [:update, :edit, :show]

  def index
    @airport = Airport.all
  end

  def new
    @airport = Airport.new(airport_params)

    if @airport.save
      redirect_to airports_path, flash: "Data saved"
    else
      redirect_to request.referrer, flash: {error: @airport.errors.full_messages} 
    end
    
  end

  def create
    @airport = Airport.new
  end

  def update
    if @airport.update(airport_params)
      redirect_to airports_path, flash: "Data updated"
    else
      redirect_to request.referrer, flash: {error: @airport.errors.full_messages}
    end
    
  end

  def edit

  end

  def show

  end

  def set_airport
    @airport = Airport.find(params[:id])
  end

  private

  def aiport_params
    params.require(:airport).permit(:iata_code, :airport, :city, :state, :country, :latitude, :longitude)
  end
  
  
end
