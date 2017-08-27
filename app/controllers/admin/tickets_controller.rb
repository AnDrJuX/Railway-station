class Admin::TicketsController < Admin::BaseController
  before_action :authenticate_user!, only: :create
  before_action :set_ticket, only: [:show, :edit, :destroy, :update]

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to [:admin, @ticket]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket]
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :surname, :patronymic, :passport_number, :passport_serial, :first_station_id, :last_station_id, :train_id, :user_id)
  end
end