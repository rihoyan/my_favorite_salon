class Customers::ReservationsController < ApplicationController

  def step1
    @rsv = Reservation.new
    @favorites = Favorite.where(customer_id: current_customer.id)
  end

  def step2
    session[:salon_id] = params[:reservation][:salon_id]
    @rsv = Reservation.new
    @salon = Salon.find(session[:salon_id])
    @reservations = Reservation.where(salon_id: session[:salon_id]).where("date >= ?", Date.current).where("date < ?", Date.current >> 3).order(date: :desc)
  end

  def step3
    @rsv = Reservation.new
  end

  def step4
    @rsv = Reservation.new
    @customer = Customer.find(current_customer.id)
  end

  def confirm
  end

end