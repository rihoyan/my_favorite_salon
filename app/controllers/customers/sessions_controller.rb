# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
   before_action :configure_permitted_parameters, only: [:create, :guest_sign_in]
   layout 'customers/application'

  # GET /resource/sign_in
   def new
     super
    flash[:success] = "ログインしました！"
   end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def after_sign_in_path_for(resource)
    customer_path(resource)
  end

  def guest_sign_in
    customer = Customer.find_or_create_by!(telephone_number: '09011112222',email: 'sample@sample.com',last_name: '田中',first_name: 'りほこ',last_name_kana: 'タナカ', first_name_kana: 'リホコ',nickname: 'りほこ') do |customer|
    customer.password = SecureRandom.urlsafe_base64
    end
    sign_in customer
    redirect_to customers_path, success: "ゲストユーザーとしてログインしました！"
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:telephone_number, :password]
    devise_parameter_sanitizer.permit :sign_in,keys: added_attrs
    devise_parameter_sanitizer.permit :guest_sign_in,keys: added_attrs
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
