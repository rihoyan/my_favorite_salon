class Salons::SalonsController < ApplicationController
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