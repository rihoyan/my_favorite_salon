class Customers::SalonsController < Customers::ApplicationController

  def index
    @q = Salon.ransack(params[:q])
    @results = @q.result
  end

  def show
   @salon = Salon.find(params[:id])
   @pref = Prefecture.find(@salon.prefecture_id)
   @city = Municipality.find(@salon.municipality_id)
  end

end
