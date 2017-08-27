class SearchesController < ApplicationController

  def create
    @first_station = RailwayStation.find(params["first_station"])
    @last_station = RailwayStation.find(params["last_station"])
    @result = Search.find_routes(@first_station, @last_station)
    @result_trains = Search.find_trains(@result)
    if @result_trains.present?
      render :show
    else
      render :new
    end
  end

  def show
  end

end