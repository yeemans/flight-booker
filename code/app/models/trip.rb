class Trip < ApplicationRecord
    belongs_to :airport 
    belongs_to :flight
end
