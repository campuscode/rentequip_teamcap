require 'rails_helper'

feature 'user create contracts' do
  scenario 'successfully' do
    equipment1 = create(:equipment)
    equipment2 = create(:equipment, name: 'Betoneira')

    contract = build(:contract)

    visit new_contract_path

    fill_in 'Cliente',         with: contract.customer
    fill_in 'Início',          with: contract.started_at
    select  contract.deadline, from: 'Prazo'
    fill_in 'Preço',           with: contract.price
    check equipment1.name
    check equipment2.name
    fill_in 'Endereço',        with: contract.address
    fill_in 'Contato',         with: contract.contact

    click_on 'Criar Contrato'

    expect(page).to have_content contract.customer
    expect(page).to have_content contract.started_at.strftime('%d/%m/%Y')
    expect(page).to have_content contract.deadline
    expect(page).to have_content
    (contract.started_at + contract.deadline).strftime('%d/%m/%Y')
    expect(page).to have_content contract.price
    expect(page).to have_content equipment1.name
    expect(page).to have_content equipment2.name
    expect(page).to have_content contract.address
    expect(page).to have_content contract.contact
  end

  scenario 'user create contract and failed' do
    visit new_contract_path

    click_on 'Criar Contrato'

    expect(page).to have_content('Customer can\'t be blank')
    expect(page).to have_content('Started at can\'t be blank')
    expect(page).to have_content('Price can\'t be blank')
    expect(page).to have_content('Address can\'t be blank')
    expect(page).to have_content('Contact can\'t be blank')
  end

  scenario 'user view contract detail' do
    contract = create(:contract)

    visit contracts_path

    click_on 'Ver detalhes'

    expect(current_path).to eq(contract_path(contract))
  end
end
