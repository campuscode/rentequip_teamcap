class EquipmentController < ApplicationController
  def index
    @equipment = Equipment.all
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)

    if @equipment.save
      redirect_to @equipment
    else
      flash[:error] = @equipment.errors.full_messages
      render :new
    end
  end

  def edit
    @equipment = Equipment.find(params[:id])
  end

  def update
    @equipment = Equipment.find(params[:id])

    if @equipment.update(equipment_params)
      redirect_to @equipment
    else
      flash[:error] = @equipment.errors.full_messages
      render :edit
    end
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :supplier, :serial_number, :brand,
                                      :notes)
  end
end
