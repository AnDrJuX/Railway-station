class Admin::WagonsController < Admin::BaseController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

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
    @wagon = @train.wagons.new(wagon_params)
    if @wagon.save
      redirect_to [:admin, @train]
    else
      render :new
    end
  end

  def update
    if @wagon.update(wagon_params)
      redirect_to admin_wagons_path(@wagon)
    else
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to admin_wagons_path(@wagon)
  end

  protected
  # Use callbacks to share common setup or conswagonts between actions.
  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def wagon_params
    params.require(:wagon).permit(:name, :top_place, :bottom_place, :train_id, :seat_place, :side_top_place, :side_bottom_place, :number, :position)
  end
end
