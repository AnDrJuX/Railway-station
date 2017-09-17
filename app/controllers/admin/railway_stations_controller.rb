class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position, :update_arrival, :update_departure]
  before_action :set_route, only: [:update_position, :update_arrival, :update_departure]

  # GET /railway_stations
  def index
    @railway_stations = RailwayStation.all
  end

  # GET /railway_stations/1
  def show
  end

  # GET /railway_stations/new
  def new
    @railway_station = RailwayStation.new
  end

  # GET /railway_stations/1/edit
  def edit
  end

  # POST /railway_stations
  def create
    @railway_station = RailwayStation.new(railway_station_params)
    if @railway_station.save
      redirect_to [:admin, @railway_station]
    else
      render :new
    end
  end

  # PATCH/PUT /railway_stations/1
  def update
    if @railway_station.update(railway_station_params)
      redirect_to admin_railway_stations_path
    else
      render :edit
    end
  end

  # DELETE /railway_stations/1
  def destroy
    @railway_station.destroy
    redirect_to admin_railway_stations_path
  end

  def update_position
    @railway_station.update_position(@route, params[:position])
    redirect_to [:admin, @route]
  end

  def update_arrival
    @railway_station.update_time(@route, :arrival, params[:arrival])
    redirect_to [:admin, @route]
  end

  def update_departure
    @railway_station.update_time(@route, :departure, params[:departure])
    redirect_to [:admin, @route]
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  def set_route
    @route = Route.find(params[:route_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def railway_station_params
    params.require(:railway_station).permit(:title, :position, :start_station, :finish_station, :arrival, :departure)
  end
end
