class Airport < ApplicationRecord
  has_many :trips
  has_many :departing_flights, through: :trips, source: :flight, dependent: :destroy
  has_many :arriving_flights, through: :trips, source: :flight, dependent: :destroy
end
