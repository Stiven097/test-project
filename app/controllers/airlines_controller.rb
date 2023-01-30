class AirlinesController < ApplicationController

  before_action :set_airline, only: [:update, :edit, :show, :destroy]

  def new
    @airline = Airline.new
  end

  def create
    @airline = Airline.new(airline_params)

    if @airline.save
      redirect_to airlines_path, notice: "Data saved"
    else
      redirect_to request.referrer, flash: {error: @airline.errors.full_messages}
    end
    
  end

  def index
    @airlines = Airline.all
  end

  def update

    if @airline.update(airline_params) 
      redirect_to airlines_path, notice: "Data updated"
    else
      redirect_to request.referrer, flash: {error: @airline.errors.full_messages}
    end
    
  end

  def edit

  end

  def show
  end

  def set_airline
    @airline = Airline.find(params[:id])
  end
  
  def destroy

    airlineId = Flight.where(airline_id: @airline)

    if airlineId.exists?
      redirect_to airports_path, alert: "Cannot delete airport because there is a flight or more related to it. Please change this relation first."
    else
      if @airline.destroy
        redirect_to request.referrer, notice: "The data has been deleted"
      else
        redirect_to request.referrer, flash: {error: @airport.errors.full_messages}
      end
    end

  end
  
  def airline_params
    params.require(:airline).permit(:iata_code, :airline)
  end
  
end
