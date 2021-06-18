class BookingsController < ApplicationController

  def new 
    @booking = Booking.new
    @passengers = []
    @flight = Flight.find(params[:flight][:flight])
    params[:flight][:passengers].to_i.times do 
      @passengers.push(Passenger.create())
    end 
  end 

  def show 
    @flight = Flight.find(session[:flight])
  end 

  def create 
    # create passengers 
    @flight = Flight.find(session[:flight])
    params[:booking][:passenger].each do |passenger, attributes| 
      @flight.passengers.create(name: attributes[:name], email: attributes[:email])
    end
    # delete nil passengers
    Passenger.where(:name => nil).or(Passenger.where(:email => nil )).each do |invalid| 
      invalid.delete
    end
    redirect_to '/bookings'
  end 

  def passenger_params()
    params.require(:booking).permit(:passenger)
  end
   
end
