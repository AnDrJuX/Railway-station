class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

end
