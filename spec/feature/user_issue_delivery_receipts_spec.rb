require 'rails_helper'

feature 'User issue delivery receipts' do
  scenario 'successfully' do
    contract = create(:contract)
    visit contract_path(contract)

    click_on 'Recibo de entrega'

    expect(page).to have_content('Recibo de Entrega')
  end
end
