class Flight < ApplicationRecord
    has_many :trips, foreign_key: :flight_id
    has_many :bookings
    has_many :passengers, through: :bookings
    belongs_to :from_airport, class_name: "Airport", dependent: :destroy
    belongs_to :to_airport, class_name: "Airport", dependent: :destroy
end
