class Salons::MenusController < Salons::ApplicationController
  before_action :authenticate_salon!

  def new
    @menu = Menu.new
    @menus = Menu.where(salon_id: current_salon.id)
  end

  def create
    menu = Menu.new(name: menu_params[:name], time: menu_params[:time], price: menu_params[:price], salon_id: current_salon.id)
    if menu.save
      redirect_to new_salons_menu_path
    else
      @menu = menu
      @menus = Menu.where(salon_id: current_salon.id)
      render 'new', danger: "登録に失敗しました"
    end
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    menu = Menu.find(params[:id])
    if menu.update(menu_params)
      redirect_to new_salons_menu_path, success: "メニューを変更しました"
    else
      render 'edit', danger: "メニューの変更に失敗しました"
    end
  end

  def destroy
    menu = Menu.find(params[:id])
    if menu.destroy
      redirect_to new_salons_menu_path
    else
      render 'new', danger: "メニューの削除に失敗しました"
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :time, :price, :salon_id)
  end

end
