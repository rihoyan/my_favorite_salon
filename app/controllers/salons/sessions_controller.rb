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

  protected

  def configure_sign_in_params
　   devise_parameter_sanitizer.permit(:sign_in, keys: [:phone_number])
  end
end
