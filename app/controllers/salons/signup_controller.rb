class Salons::SignupController < ApplicationController

  def step1
    @salon = Salon.new
  end

  def step2
    @salon = Salon.new
    session[:name] = params[:salon][:name]
    session[:name_kana] = params[:salon][:name_kana]
    session[:address] = params[:salon][:address]
    session[:phone_number] = params[:salon][:phone_number]
    session[:email] = params[:salon][:email]
    session[:password] = params[:salon][:password]
    session[:password_confirmation] = params[:salon][:password_confirmation]
  end

  def step3
    @salon = Salon.new
    session[:staff_name] = params[:salon][:staff_name]
    session[:start_time] = params[:salon][:start_time]
    session[:end_time] = params[:salon][:end_time]
    session[:seats] = params[:salon][:seats]
    session[:stylists] = params[:salon][:stylists]
    session[:salon_image_id] = params[:salon][:salon_image_id]
    session[:introduction] = params[:salon][:introduction]
  end

  def confirm
    session[:menu_ids] = params[:menu_ids]
    if session[:salon_image_id].present?
      @image_filename = session[:salon_image_id]
    end
  end

  def create
    @salon = Salon.new(
      name: session[:name],
      name_kana: session[:name_kana],
      address: session[:address],
      phone_number: session[:phone_number],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      staff_name: session[:staff_name],
      start_time: session[:start_time],
      end_time: session[:end_time],
      seats: session[:seats],
      salon_image_id: session[:salon_image_id],
      introduction: session[:introduction]
      )

      if @salon.save
        menu_salon = Menu_salon.new(menu_id: session[:menu_id], salon_id: @salon.id)
        menu_salon.save
        session[:id] = @salon.id
        sign_in Salon.find(session[:id])
      else
        render 'step1', danger: "会員登録に失敗しました。もう一度初めからやり直してください"
      end
  end

  private

  def salon_params
    params.require(:salon).permit(
      :name,
      :name_kana,
      :address,
      :phone_number,
      :email,
      :password,
      :password_confirmation,
      :staff_name,
      :start_time,
      :end_time,
      :seats,
      :salon_image,
      :introduction)
    params.require(:menu).permit(menu_ids: [])
  end
end
