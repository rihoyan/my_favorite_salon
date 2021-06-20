class Salons::SalonsController < Salons::ApplicationController
  before_action :authenticate_salon!

  def show
    @salon = current_salon
    @salon = Salon.find(current_salon.id)
  end

  def edit
    @salon = current_salon
  end

  def salon_image
    @salon = current_salon
  end

  def update
    salon = current_salon
    if salon.update(salon_params)
      redirect_to salons_reservations_path, success: "更新しました"
    else
      @salon = current_salon
      render 'edit', danger: "更新に失敗しました"
    end
  end

  private

    def salon_params
      params.require(:salon).permit(
        :email,
        :prefecture_id,
        :municipality_id,
        :name,
        :name_kana,
        :address,
        :telephone_number,
        :start_time,
        :end_time,
        :seats,
        :staff_name,
        :stylists,
        :introduction,
        :salon_image)
    end
end
