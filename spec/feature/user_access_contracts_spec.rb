require 'rails_helper'

feature 'User access contracts' do
  scenario 'successfully' do
    contract = Contract.create(started_at: Time.zone.today,
                               finished_at: Time.zone.today + 90.days
                              )

    visit contracts_path

    expect(page).to have_content(contract.started_at.strftime('%d/%m/%Y'))
    expect(page).to have_content(contract.finished_at.strftime('%d/%m/%Y'))
  end

  scenario 'see all contracts' do
    contracts = []
    3.times do
      contracts << Contract.create(started_at: Time.zone.today,
                                   finished_at: Time.zone.today + 90.days
                                  )
    end

    visit contracts_path
    expect(page).to have_content(contracts[0].started_at.strftime('%d/%m/%Y'))
    expect(page).to have_content(contracts[1].started_at.strftime('%d/%m/%Y'))
    expect(page).to have_content(contracts[2].started_at.strftime('%d/%m/%Y'))
  end

  scenario 'dont see contracts' do
    visit contracts_path

    expect(page).to have_content('Nenhum Contract cadastrado.')
  end
end
