class ContractsController < ApplicationController
  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.create(contract_params)
    redirect_to @contract
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
      .permit(:customer, :started_at, :finished_at, :price, :equipment, :address, :contact)
    end
end
