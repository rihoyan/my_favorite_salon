class Salons::SignupController < ApplicationController

  def step1
    @salon = Salon.new
    #@pref = Prefecture.all
    #@city = Municipality.all
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
    @pref = Prefecture.find(session[:prefecture_id])
    @city = Municipality.find(session[:municipality_id])
    session[:menu_ids] = params[:menu_ids]
    if session[:salon_image_id].present?
      @image_filename = session[:salon_image_id]
    end
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
      salon_image_id: session[:salon_image_id],
      introduction: session[:introduction]
      )
      #binding.pry

      if @salon.save!
        session[:menu_ids].each do |menu|
          menu_salon = MenuSalon.new(menu_id: menu, salon_id: @salon.id)
          menu_salon.save!
        end
        session[:id] = @salon.id
        sign_in Salon.find(session[:id])
        redirect_to salons_index_path

      else
        render 'step1', danger: "会員登録に失敗しました。もう一度初めからやり直してください"
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
      :salon_image,
      :introduction)
    params.require(:menu).permit(menu_ids: [])
  end
end
