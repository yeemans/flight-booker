class FlightsController < ApplicationController
    def show 
      flights = Flight.all
      airports = Airport.all
    end 
    def airport_params 
      params.require(:airport).permit(:from_airport, :to_airport)
    end
end
