require 'rails_helper'

feature 'User issue delivery receipts' do
  scenario 'successfully' do
    contract = create(:contract)
    visit contract_path(contract)

    click_on 'Recibo de entrega'

    within('h1') do
      expect(page).to have_content('Recibo de Entrega')
    end

    within('h2') do
      expect(page).to have_content(contract.delivery_receipt.created_at.strftime('%d de %B de %Y'))
    end

    within('p') do
      expect(page).to have_content("Eu, #{contract.contact}, em nome da empresa
      #{contract.customer}, inscrita no CNPJ 123456789 declaro ter recebido os
      equipamentos #{contract.equipment.map(&:name).join(', ')} pelo período de
      #{contract.started_at} à #{contract.finished_at} em perfeitas condições de
      uso no endereço #{contract.address} no dia
        #{contract.delivery_receipt.created_at} de acordo com o contrato nº
        #{contract.id}.")
    end

    expect(page).to have_content('Voltar')
  end
end
