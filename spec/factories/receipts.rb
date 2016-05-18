FactoryGirl.define do
  factory :delivery_receipt do
    contract
    type 'DeliveryReceipt'
  end

  factory :return_receipt do
    contract
    type 'ReturnReceipt'
  end
end
