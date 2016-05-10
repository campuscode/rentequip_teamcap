require 'rails_helper'

feature 'User access contracts' do
  scenario 'successfully' do
    contracts = []
    3.times { contracts << create(:contract) }

    visit contracts_path

    within('h1') do
      expect(page).to have_content 'Contratos'
    end

    expect(page).to have_content(contracts[0].customer)
    expect(page).to have_content(contracts[0].started_at.strftime('%d/%m/%Y'))
    expect(page).to have_content(contracts[0].finished_at.strftime('%d/%m/%Y'))
    expect(page).to have_content(contracts[0].price)
    expect(page).to have_content(contracts[1].started_at.strftime('%d/%m/%Y'))
    expect(page).to have_content(contracts[2].started_at.strftime('%d/%m/%Y'))
  end

  scenario 'dont see contracts' do
    visit contracts_path

    expect(page).to have_content('Nenhum Contrato cadastrado.')
  end

  scenario 'visit a contract' do
    contract = create(:contract)

    visit contract_path(contract)

    expect(page).to have_content(contract.customer)
    expect(page).to have_content(contract.started_at.strftime('%d/%m/%Y'))
    expect(page).to have_content(contract.finished_at.strftime('%d/%m/%Y'))
    expect(page).to have_content(contract.price)
  end
end
