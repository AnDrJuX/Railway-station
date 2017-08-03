class WagonsController < ApplicationController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @wagon = Wagon.new
  end

  def edit
  end

  def create
    @wagon = Wagon.new(wagon_params)
    if @wagon.save
      redirect_to @wagon, notice: 'Wagon was successfully created.'
    else
      render :new
    end
  end

  def update
    if @wagon.update(wagon_params)
      redirect_to @wagon, notice: 'Wagon was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to wagons_url, notice: 'Wagon was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or conswagonts between actions.
  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def wagon_params
    params.require(:wagon).permit(:name, :top_place, :bottom_place, :train_id)
  end
end