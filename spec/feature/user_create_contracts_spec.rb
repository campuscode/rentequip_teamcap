require 'rails_helper'

feature 'user create contracts' do
  scenario 'successfully' do
    equipment1 = create(:equipment)
    equipment2 = create(:equipment, name: 'Betoneira')

    contract = build(:contract)

    visit new_contract_path

    fill_in 'Customer',      with: contract.customer
    fill_in 'Started at',    with: contract.started_at
    fill_in 'Finished at',   with: contract.finished_at
    fill_in 'Price',         with: contract.price
    check equipment1.name
    check equipment2.name
    fill_in 'Address',       with: contract.address
    fill_in 'Contact',       with: contract.contact

    click_on 'Criar Contrato'

    expect(page).to have_content contract.customer
    expect(page).to have_content contract.started_at.strftime('%d/%m/%Y')
    expect(page).to have_content contract.finished_at.strftime('%d/%m/%Y')
    expect(page).to have_content contract.price
    expect(page).to have_content equipment1.name
    expect(page).to have_content equipment2.name
    expect(page).to have_content contract.address
    expect(page).to have_content contract.contact
  end

  scenario 'user create contract and failed' do
    visit new_contract_path

    click_on 'Criar Contrato'

    expect(page).to have_content 'Todos os campos são obrigatórios'
  end
end
