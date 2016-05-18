require 'rails_helper'

feature 'User issue return receipt' do
  scenario 'unavailable' do
    contract = create(:contract)

    visit contract_path(contract)

    within('.pull-right') do
      expect(page).not_to have_content('Recibo de devolução')
    end
  end

  scenario 'successfully' do
    contract = create(:contract)
    delivery_receipt = create(:delivery_receipt, contract: contract)

    visit contract_path(contract)

    click_on 'Recibo de devolução'

    within('h1') do
      expect(page).to have_content('Recibo de Devolução')
    end

    within('h2') do
      expect(page).to have_content(contract.return_receipt.created_at.strftime('%d de %B de %Y'))
    end

    within('p') do
      expect(page).to have_content("Eu, #{contract.contact}, declaro ter
      recebido os equipamentos #{contract.equipment.map(&:name).join(', ')} em
      devolução referente ao contrato nº #{contract.id} em perfeitas condições
      da empresa #{contract.customer}, inscrita no CNPJ 123456789 no dia
      #{delivery_receipt.created_at}.")
    end

    expect(page).to have_content('Voltar')
  end
end
