require 'rails_helper'

describe "User edit customer" do
  it "the right customer" do
    #Arrange
    customer1 = Customer.create!(name: "Adriano", last_name: "Silva", email: 'adriano@email.com',
                                  birthday: '08/02/1991', street: 'rua das mangueiras',district: 'Brotas',
                                  number: '40', complement: 'apto 203', city: 'Salvador',
                                  state: 'Bahia', cellphone: '9999999999')
    customer2 = Customer.create!(name: "Bianca", last_name: "Sedro", email: 'bianca@email.com',
                                  birthday: '31/10/1999', street: 'rua das margaridas',district: 'Barra',
                                  number: '200', complement: 'apto 500', city: 'Salvador',
                                  state: 'Bahia', cellphone: '9999999999')

    # Act
    visit customers_path
    click_on 'Adriano Silva'
    click_on 'Editar'
    fill_in "Nome",	with: "Roberto"
    fill_in "E-mail",	with: "roberto@email.com"
    click_on 'Atualizar Cliente'

    # Assert
    expect(page).to have_content 'Roberto'
    expect(page).to have_content 'roberto@email.com'
    expect(page).to have_content 'Endereço: rua das mangueiras'
    expect(page).not_to have_content 'Bianca Sedro'
    expect(page).not_to have_content 'bianca@email.com'
    expect(page).not_to have_content 'rua das margaridas'
    expect(page).not_to have_content 'Adriano Silva'
    expect(page).not_to have_content 'adriano@email.com'

  end
  it "cant update because name and email was blank" do
    #Arrange
    customer1 = Customer.create!(name: "Adriano", last_name: "Silva", email: 'adriano@email.com',
                                  birthday: '08/02/1991', street: 'rua das mangueiras',district: 'Brotas',
                                  number: '40', complement: 'apto 203', city: 'Salvador',
                                  state: 'Bahia', cellphone: '9999999999')
    customer2 = Customer.create!(name: "Bianca", last_name: "Sedro", email: 'bianca@email.com',
                                  birthday: '31/10/1999', street: 'rua das margaridas',district: 'Barra',
                                  number: '200', complement: 'apto 500', city: 'Salvador',
                                  state: 'Bahia', cellphone: '9999999999')

    # Act
    visit customers_path
    click_on 'Adriano Silva'
    click_on 'Editar'
    fill_in "Nome",	with: ""
    fill_in "E-mail",	with: ""
    click_on 'Atualizar Cliente'

    # Assert
    expect(page).to have_content 'Não foi possível atualizar'
    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'E-mail não pode ficar em branco'

  end


end
