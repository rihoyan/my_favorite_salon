class Customers::ReservationsController < Customers::ApplicationController
  before_action :authenticate_customer!

  def show
    @reservation = Reservation.find(params[:id])
  end

  def index
      @reservations = Reservation.where(customer_id: current_customer.id).where("day > ?", Date.today).order("day")
      reserv = Reservation.where(customer_id: current_customer.id)
      @order_details = OrderDetail.where(reservation_id: reserv.ids).order("id")
  end

  def step1
    @rsv = Reservation.new
    @favorites = Favorite.where(customer_id: current_customer.id)
  end

  def step2
    @rsv = Reservation.new
    @menus = Menu.where(salon_id: session[:salon_id])
    session[:salon_id] = params[:salon_id]
  end

  def step3
    @rsv = Reservation.new
    @reservations = Reservation.where(salon_id: session[:salon_id])
    session[:menu_id] = params[:reservation][:menu_id]
  end

  def step4
    @rsv = Reservation.new
    @customer = Customer.find(current_customer.id)
    session[:start_time] = params[:reservation][:start_time]
    session[:day] = params[:reservation][:day]
  end

  def confirm
    @rsv = Reservation.new
    @menu = Menu.find(session[:menu_id])
    session[:telephone_number] = params[:reservation][:telephone_number]
    @salon = Salon.find(session[:salon_id])
  end

  def create
    @rsv = Reservation.new(
      customer_id: current_customer.id,
      salon_id: session[:salon_id],
      day: session[:day],
      start_time: session[:start_time],
      telephone_number: session[:telephone_number],
      menu_id: session[:menu_id]
      )
      binding.pry

      if @rsv.save
        session[:id] = @rsv.id
        redirect_to done_reservations_path, success: "予約が完了しました。参考画像やコメントを送付したい方は以下より送信してください"
      else
        @rsv = Reservation.new
        @favorites = Favorite.where(customer_id: current_customer.id)
        render 'step1', danger: "予約に失敗しました。もう一度初めからやり直してください"
      end
  end

  def done
    @reservation = Reservation.find(session[:id])
  end

  def update
    reservation = Reservation.find(session[:id])
    if reservation.update!(reservation_params)
      redirect_to reservation_path(reservation), success: "登録できました。ご来店お待ちしております"
    else
      redirect_to request.referer, danger: "登録に失敗しました"
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :customer_id,
      :salon_ida,
      :day,
      :start_time,
      :telephone_number,
      :menu_id,
      :ref_image,
      :ref_comment
      )
  end
end