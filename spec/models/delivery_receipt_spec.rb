require 'rails_helper'

RSpec.describe DeliveryReceipt, type: :model do
  it 'create' do
    contract = create(:contract)
    expect{contract.create_delivery_receipt}.to change{Receipt.count}.by(1)    
  end
end
