class Customer::ApplicationController < ActionController::Base
  before_action :authenticate_customers!
  layout 'customers/application'
end
