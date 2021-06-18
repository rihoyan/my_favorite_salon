class Customers::SalonsController < Customers::ApplicationController
  before_action :authenticate_customer!

  def index
    @q = Salon.ransack(params[:q])
    @results = @q.result
  end

  def show
   @salon = Salon.find(params[:id])
   @images = Image.where(salon_id: @salon.id)
   @pref = Prefecture.find(@salon.prefecture_id)
   @city = Municipality.find(@salon.municipality_id)
  end

end
