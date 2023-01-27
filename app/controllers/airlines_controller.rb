class AirlinesController < ApplicationController

  before_action :set_airline, only: [:update, :edit, :show]

  def new
    @airline = Airline.new
  end

  def create
    @airline = Airline.new(airline_params)

    if @airline.save
      redirect_to airlines_path, notice: "Datos guardados"
    else
      redirect_to request.referrer, flash: {error: @airline.errors.full_messages}
    end
    
  end

  def index
    @airlines = Airline.all
  end

  def update

    if @airline.update(airline_params) 
      redirect_to airlines_path, notice: "Datos actualizados"
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
  

  def airline_params
    params.require(:airline).permit(:iata_code, :airline)
  end
  
end
