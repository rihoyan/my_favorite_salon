class Customers::ImagesController < Customers::ApplicationController
  before_action :authenticate_customer!

  def index
    @images = Image.all
  end
end
