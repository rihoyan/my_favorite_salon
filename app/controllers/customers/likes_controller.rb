class Customers::LikesController < Customers::ApplicationController
  before_action :authenticate_customer!

  def index
    @likes = Like.where(customer_id: current_customer.id)
  end

  def create
    like = Like.new
    like.customer_id = current_customer.id
    like.image_id = params[:image_id]

    if like.save!
      redirect_to request.referer
    else
      render 'cutomers/images/index'
    end
  end

  def destroy
    like = Like.find_by(customer_id: current_customer.id, image_id: params[:image_id])
    like.destroy
    redirect_to request.referer
  end

end
