class Customers::ReservationsController < Customers::ApplicationController

  def step1
    @rsv = Reservation.new
    @favorites = Favorite.where(customer_id: current_customer.id)
  end

  def step2
    session[:salon_id] = params[:reservation][:salon_id]
    @rsv = Reservation.new
    @reservations = Reservation.where(salon_id: session[:salon_id]).where("date >= ?", Date.current).where("date < ?", Date.current >> 3).order(date: :desc)
    @salon = Salon.find(session[:salon_id])
    #@salon_hours = []
    #i = @salon.start_time
    #while true do
      #if i >= @salon.end_time
        #break
        #i += 0.5.hour
        #[] <<  i
      #end
    #end
  end

  def step3
    @rsv = Reservation.new
    @menus = Menu.where(salon_id: session[:salon_id])
  end

  def step4
    @rsv = Reservation.new
    @customer = Customer.find(current_customer.id)
    binding.pry
    session[:menu_id] = params[:reservation][:menu_id]
  end

  def confirm
    @rsv = Reservation.new
  end

end