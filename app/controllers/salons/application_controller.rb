class ApplicationController < ActionController::Base
    layout 'salons/application'
    add_flash_types :success, :info, :warning, :danger
    before_action :authenticate_salon!
end
