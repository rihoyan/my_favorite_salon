class Customers::CustomersController < Customers::ApplicationController

  def show
    @customer = current_customer
  end
end
