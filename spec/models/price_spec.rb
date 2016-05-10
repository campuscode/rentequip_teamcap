require 'rails_helper'

RSpec.describe Price, type: :model do
  it '#amount' do
    price = FactoryGirl.create(:price)

    expect(price.amount).to eq(price.deadline * price.value)
  end
end
