class ContractsController < ApplicationController
  def new
    @contract = Contract.new
    @equipment = Equipment.all
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to @contract
    else
      @equipment = Equipment.all
      flash[:error] = @contract.errors.full_messages
      render :new
    end
  end

  def show
    @contract = Contract.find(params[:id])
  end

  def index
    @contracts = Contract.all
  end

  private

  def contract_params
    params.require(:contract)
          .permit(:customer, :started_at, :finished_at, :price,
                  :address, :contact, equipment_ids: [])
  end
end
