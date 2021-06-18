class Salons::ReservationsController < Salons::ApplicationController
  before_action :authenticate_salon!

  def index
    @today_reserv = Reservation.where(day: DateTime.now)
    @reservations = Reservation.where(salon_id: current_salon.id).where("day > ?", Date.today).order("day")
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
end
