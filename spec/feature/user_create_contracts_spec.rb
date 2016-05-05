require 'rails_helper'

feature 'user create contracts' do
  scenario 'successfully' do
    contract = Contract.new(customer: 'Diego',
                            started_at: Time.zone.today,
                            finished_at: Time.zone.today + 30.days,
                            price: 'R$ 5355',
                            equipment: 'Furadeira',
                            address: 'Rua alameda santos 1293',
                            contact: 'Zé')
    visit new_contract_path

    fill_in 'Customer',      with: contract.customer
    fill_in 'Started at',    with: contract.started_at
    fill_in 'Finished at',   with: contract.finished_at
    fill_in 'Price',         with: contract.price
    fill_in 'Equipment',     with: contract.equipment
    fill_in 'Address',       with: contract.address
    fill_in 'Contact',       with: contract.contact

    click_on 'Criar Contrato'

    expect(page).to have_content contract.customer
    expect(page).to have_content contract.started_at
    expect(page).to have_content contract.finished_at
    expect(page).to have_content contract.price
    expect(page).to have_content contract.equipment
    expect(page).to have_content contract.address
    expect(page).to have_content contract.contact
  end
end
