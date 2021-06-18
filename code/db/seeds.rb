# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# create airports
@NYC = Airport.new({code: "NYC"})
@SFO = Airport.new({code: "SFO"})
@LAX = Airport.new({code: "LAX"})
midnight = Date.today

# build departing flights for each airport
(Date.today..Date.parse('2021-12-25')).each do |day|
  @NYC.departing_flights.build({from_airport: @NYC, to_airport: @SFO, start: day, duration: "7 hours" })
  @NYC.departing_flights.build({from_airport: @NYC, to_airport: @LAX, start: day, duration: "1 hour" })

  @SFO.departing_flights.build({from_airport: @SFO, to_airport: @NYC, start: day, duration: "7 hours" })
  @SFO.departing_flights.build({from_airport: @SFO, to_airport: @LAX, start: day, duration: "1 hour" }) 

  @LAX.departing_flights.build({from_airport: @LAX, to_airport: @NYC, start: day, duration: "7 hours" })
  @LAX.departing_flights.build({from_airport: @LAX, to_airport: @SFO, start: day, duration: "1 hour" }) 
  
  # build another half of afternoon flights 
  afternoon = day + 14 * 60 * 60 
  @NYC.departing_flights.build({from_airport: @NYC, to_airport: @SFO, start: afternoon, duration: "7 hours" })
  @NYC.departing_flights.build({from_airport: @NYC, to_airport: @LAX, start: afternoon, duration: "1 hour" })

  @SFO.departing_flights.build({from_airport: @SFO, to_airport: @NYC, start: afternoon, duration: "7 hours" })
  @SFO.departing_flights.build({from_airport: @SFO, to_airport: @LAX, start: afternoon, duration: "1 hour" }) 

  @LAX.departing_flights.build({from_airport: @LAX, to_airport: @NYC, start: afternoon, duration: "7 hours" })
  @LAX.departing_flights.build({from_airport: @LAX, to_airport: @SFO, start: afternoon, duration: "1 hour" })  
end 
# set half of these flights to occur at afternoon 

# Save departing and arriving flights to db 
@NYC.save! 
@SFO.save!
@LAX.save!
Airport.first.arriving_flights = Flight.where(:to_airport_id => 1)
Airport.second.arriving_flights = Flight.where(:to_airport_id => 2)
Airport.third.arriving_flights = Flight.where(:to_airport_id => 3)

Flight.all.each do |flight| 
  flight.update(:start => Date.new(flight.start.year, flight.start.month, flight.start.day).change(year: 2021))
end
# make half of the odds afternoon, and half of the evens afternoon
count = 0
Flight.where("id % 2 != 0").each do |flight|
  count += 1 
  flight.update(:start => flight.start + 14 * 3600) if count % 2 == 1
end
count = 0
Flight.where("id % 2 == 0").each do |flight|
  count += 1 
  flight.update(:start => flight.start + 14 * 3600) if count % 2 == 1
end