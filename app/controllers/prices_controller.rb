class PricesController < ApplicationController
  def index
    @prices = Price.all
  end

  def new
    @price = Price.new
    @equipment = Equipment.all
  end

  def create
    @price = Price.new(price_params)

    if @price.save
      redirect_to @price
    else
      @equipment = Equipment.all
      flash[:errors] = @price.errors.full_messages
      render :new
    end
  end

  def show
    @price = Price.find(params[:id])
  end

  private

  def price_params
    params.require(:price).permit(:equipment_id, :deadline, :value)
  end
end
