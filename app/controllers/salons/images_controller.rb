class Salons::ImagesController < Salons::ApplicationController
  before_action :authenticate_salon!

  def index
    @image = Image.new
    @images = Image.where(salon_id: current_salon.id)
  end

  def create
    image = Image.new(style_image: image_params[:style_image], salon_id: current_salon.id)
    if image.save
      redirect_to request.referer, success: "画像投稿に成功しました"
    else
      @image = image
      @images = Image.where(salon_id: current_salon.id)
      render 'index'
    end
  end

  def destroy
    image = Image.find(params[:id])
    if image.destroy!
      redirect_to request.referer, success: "画像の削除に成功しました"
    else
      render 'index', danger: "画像の削除に失敗しました"
    end
  end

  private

  def image_params
    params.require(:image).permit(:style_image, :salon_id)
  end

end
