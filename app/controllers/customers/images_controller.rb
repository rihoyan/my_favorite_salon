class Customers::ImagesController < Customers::ApplicationController

  def index
    @images = Image.all
  end
end
