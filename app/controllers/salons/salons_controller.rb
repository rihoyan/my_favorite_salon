class Salons::SalonsController < Salons::ApplicationController
  before_action :authenticate_salon!
  
  def index
    @salons = Salon.all
  end

  def show
  end

  def edit
  end

  def update
  end
end
