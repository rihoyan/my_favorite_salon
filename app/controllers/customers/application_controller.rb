class Customers::ApplicationController < ApplicationController
  layout 'customers/application'
  before_action :authenticate_customer!
end
