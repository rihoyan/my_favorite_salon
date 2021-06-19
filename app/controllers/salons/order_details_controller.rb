class Salons::OrderDetailsController < Salons::ApplicationController

  def new
    session[:reservation_id] = params[:id]
    @reservation = Reservation.find(params[:id])
    @order_detail = OrderDetail.new
    @menus = Menu.where(salon_id: current_salon.id)
  end

  def create
    order_detail = OrderDetail.new(reservation_id: session[:reservation_id])
    if order_detail.update!(order_detail_params)
      redirect_to salons_order_detail_path(order_detail)
    else
      render 'new', danger: "登録に失敗しました"
    end
  end

  def show
    @order_detail = OrderDetail.find(params[:id])
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:reservation_id, :menu_id, :styling_image, :comment, :stylist_name)
  end

end
