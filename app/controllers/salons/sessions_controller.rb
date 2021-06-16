# frozen_string_literal: true
class Salons::SessionsController < Devise::SessionsController

  # GET /resource/sign_in
   def new
     super
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
    new_salons_menu_path(current_salon)
  end

  def after_sign_out_path_for(resource)
    new_salon_session_path
  end

  protected

  def configure_sign_in_params
　   devise_parameter_sanitizer.permit(:sign_in, keys: [:telephone_number])
  end
end
