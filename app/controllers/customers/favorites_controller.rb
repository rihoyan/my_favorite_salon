class Customers::FavoritesController < ApplicationController

  def create
    @salon = Salon.find(params[:salon_id])
    favorite = current_customer.favorites.new(salon_id: @salon.id)
    if favorite.save!
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @salon = Salon.find(params[:salon_id])
    favorite = current_customer.favorites.find_by(salon_id: @salon.id)
    if favorite.present?
      favorite.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def index
    @favorites = Favorite.where(customer_id: current_customer.id)
  end

  private
  def favorite_params
    params.require(:favorite).permit(:customer_id, :salon_id)
  end
end
