class Salons::SignupController < ApplicationController

  def step1
    @salon = Salon.new
  end

  def step2
    @salon = Salon.new
    session[:name] = params[:salon][:name]
    session[:name_kana] = params[:salon][:name_kana]
    session[:prefecture_id] = params[:salon][:prefecture_id]
    session[:municipality_id] = params[:salon][:municipality_id]
    session[:address] = params[:salon][:address]
    session[:telephone_number] = params[:salon][:telephone_number]
    session[:email] = params[:salon][:email]
    session[:password] = params[:salon][:password]
    session[:password_confirmation] = params[:salon][:password_confirmation]
  end

  def confirm
    @salon = Salon.new
    session[:staff_name] = params[:salon][:staff_name]
    session[:start_time] = params[:salon][:start_time]
    session[:end_time] = params[:salon][:end_time]
    session[:seats] = params[:salon][:seats]
    session[:stylists] = params[:salon][:stylists]
    session[:introduction] = params[:salon][:introduction]
    @pref = Prefecture.find(session[:prefecture_id])
    @city = Municipality.find(session[:municipality_id])
  end

  def create
    @salon = Salon.new(
      name: session[:name],
      name_kana: session[:name_kana],
      prefecture_id: session[:prefecture_id],
      municipality_id: session[:municipality_id],
      address: session[:address],
      telephone_number: session[:telephone_number],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      staff_name: session[:staff_name],
      start_time: session[:start_time],
      end_time: session[:end_time],
      seats: session[:seats],
      stylists: session[:stylists],
      introduction: session[:introduction]
      )

      if @salon.save!
        sign_in Salon.find(@salon.id)
        redirect_to done_salons_signup_index_path
      else
        render 'step1', danger: "会員登録に失敗しました。もう一度初めからやり直してください"
      end
  end

  def done
    @salon = Salon.find(current_salon.id)
    session[:id] = @salon.id
  end

  def update
    salon = Salon.find(current_salon.id)
    if salon.update!(salon_params)
      sign_in Salon.find(session[:id]) unless salon_signed_in?
      redirect_to new_salons_menu_path, success: "登録できました。メニューの登録もしましょう"
    else
      redirect_to request.referer, danger: "登録に失敗しました"
    end
  end

  private

  def salon_params
    params.require(:salon).permit(
      :name,
      :name_kana,
      :prefecture_id,
      :municipality_id,
      :address,
      :telephone_number,
      :email,
      :password,
      :password_confirmation,
      :staff_name,
      :start_time,
      :end_time,
      :seats,
      :stylists,
      :introduction,
      :salon_image
      )
  end
end
