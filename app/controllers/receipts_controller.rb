class ReceiptsController < ApplicationController
  def create
    @contract = Contract.find(params[:contract_id])

    @receipt = @contract.create_delivery_receipt(goal: 'delivery')

    redirect_to receipt_path(@receipt)
  end

  def show
    @receipt = Receipt.find(params[:id])
  end
end
