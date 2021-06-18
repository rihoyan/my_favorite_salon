class Customers::OrderDetailsController < Customers::ApplicationController

  def show
    @order_detail = OrderDetail.find(params[:id])
  end

end
