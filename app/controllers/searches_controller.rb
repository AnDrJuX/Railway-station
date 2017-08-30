class SearchesController < ApplicationController

  def create
    @first_station = RailwayStation.find(params["first_station"])
    @last_station = RailwayStation.find(params["last_station"])
    @result = Search.find_routes(@first_station, @last_station)
    @result_trains = Search.find_trains(@result)
    if @result_trains.present?
      render :show
    else
      redirect_to new_search_path, notice: 'Билеты не найдены'
    end
  end

  def new
    @stations = RailwayStation.all
  end

  def show
  end

end