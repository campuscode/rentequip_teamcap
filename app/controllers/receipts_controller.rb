class ReceiptsController < ApplicationController
  before_action :set_contract

  def create_delivery_receipt
    @contract.create_delivery_receipt
    redirect_to delivery_receipt_contract_path(@contract)
  end

  def show_delivery_receipt
    @receipt = @contract.delivery_receipt
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end
end
