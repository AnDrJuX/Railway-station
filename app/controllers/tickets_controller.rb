class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :destroy]

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def show
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :surname, :patronymic, :passport_number, :passport_serial, :first_station_id, :last_station_id, :train_id, :user_id)
  end
end