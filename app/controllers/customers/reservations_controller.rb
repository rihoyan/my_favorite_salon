class Customers::ReservationsController < ApplicationController

  def step1
    @rsv = Reservation.new
    @favorites = Favorite.where(customer_id: current_customer.id)
  end

  def step2
    @rsv = Reservation.new
    session[:salon_id] = params[:reservation][:salon_id]
    binding.pry
    @reservations = Reservation.all.where("date >= ?", Date.current).where("date < ?", Date.current >> 3).order(date: :desc)
  end
end