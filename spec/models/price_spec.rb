require 'rails_helper'

RSpec.describe Price, type: :model do
  it '#amount' do
    price = Price.create(equipment: 'Tratoir', deadline: 10, price: '1000.00')

    expect(price.amount).to eq(price.deadline * price.price)
  end
end
