class Customers::ApplicationController < ApplicationController
  layout 'customers/application'
  add_flash_types :success, :info, :warning, :danger
  before_action :authenticate_customer!
end
