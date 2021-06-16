class Salons::ApplicationController < ApplicationController
    layout 'salons/application'
    add_flash_types :success, :info, :warning, :danger
end
