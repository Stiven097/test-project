class FlightsController < ApplicationController

  before_action :set_flight, only: [:edit, :update, :show, :destroy]
  before_action :set_airlines_and_aiports, only: [:new, :edit, :destroy]

  def index
    @flights = Flight.all
  end
  
  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)

    if @flight.save
      redirect_to flights_path, notice: "Data saved"
    else
      redirect_to request.referrer, flash: {error: @flight.errors.full_messages}
    end
    
  end

  def edit
  end

  def update

    if @flight.update(flight_params)
      redirect_to flights_path, notice: "Data updated"
    else
      redirect_to request.referrer, flash: {error: @flight.errors.full_messages}
    end
    
  end

  def show
    @airline = Airline.where(id: @flight.airline_id)
    @origin_airport = Airport.where(id: @flight.origin_airport_id)
    @destination_airport = Airport.where(id: @flight.destination_airport_id)
  end

  def set_flight
    @flight = Flight.find(params[:id])
  end

  def set_airlines_and_aiports
    @airlines = Airline.all
    @airports = Airport.all
  end
  
  def destroy

    if @flight.destroy
      redirect_to flights_path, notice: "The data has been deleted"
    else
      redirect_to request.referrer, flash: { error: @flight.errors.full_messages }
    end
    
  end
  
  private

  def flight_params
    params.require(:flight).permit(:flight_number, :year, :month, :day, :day_of_week, :airline_id, 
      :tail_number, :origin_airport_id, :destination_airport_id, :scheduled_departure, :departure_time,
      :departure_delay, :taxi_out, :wheels_off, :scheduled_time, :elapsed_time, :air_time, :distance,
      :wheels_on, :taxi_in, :scheduled_arrival, :arrival_time, :arrival_delay, :diverted, :cancelled,
      :cancellation_reason, :air_system_delay, :security_delay, :airline_delay, :late_aircraft_delay,
      :weather_delay)
  end
  
end