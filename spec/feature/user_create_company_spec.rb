require 'rails_helper'

feature 'user create company' do
  scenario 'successfully' do
    company = Company.new(name: 'Campus Code',
                          cnpj: '929283038-3839',
                          address: 'Rua alameda santos 1293',
                          mail: 'campuscode@campuscode.com.br',
                          phone: '282836739',
                          company_name: 'Campus Code LTDA',
                          contact: 'Zardini'
                         )

    visit new_company_path

    fill_in 'Name',           with: company.name
    fill_in 'Cnpj',           with: company.cnpj
    fill_in 'Address',        with: company.address
    fill_in 'Mail',           with: company.mail
    fill_in 'Phone',          with: company.phone
    fill_in 'Company name',   with: company.company_name
    fill_in 'Contact',        with: company.contact

    click_on 'Criar Empresa'

    expect(page).to have_content company.name
    expect(page).to have_content company.cnpj
    expect(page).to have_content company.address
    expect(page).to have_content company.mail
    expect(page).to have_content company.phone
    expect(page).to have_content company.company_name
    expect(page).to have_content company.contact
  end

  scenario 'user create company failed' do
    visit new_company_path

    click_on 'Criar Empresa'

    expect(page).to have_content 'Todos os campos são obrigatórios'
  end
end
