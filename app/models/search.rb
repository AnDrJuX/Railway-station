class Search < ApplicationRecord

  @stations = RailwayStation.all.map {|p| [p.title]}

  def self.find_station(station)
    Route.joins(:railway_stations_routes).where(["railway_stations_routes.railway_station_id = ?", station])
  end

  def self.find_routes(start_station, finish_station)
    first = self.find_station(start_station)
    finish = self.find_station(finish_station)
    routes = first && finish
  end

  def self.find_trains(routes)
    Train.where(route: routes)
  end
end