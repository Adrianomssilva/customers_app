require 'rails_helper'


describe "user search a customer" do
  it "com sucesso" do
    # Arrange
    customer = Customer.create!(name: "Adriano", last_name: "Silva", email: 'adriano@email.com',
                                  birthday: '08/02/1991', street: 'rua das mangueiras',district: 'Brotas',
                                  number: '40', complement: 'apto 203', city: 'Salvador',
                                  state: 'Bahia', cellphone: '9999999999', status: 0)
    customer2 = Customer.create!(name: "Bianca", last_name: "Sedro", email: 'bianca@email.com',
                                  birthday: '31/10/1999', street: 'rua das margaridas',district: 'Barra',
                                  number: '200', complement: 'apto 500', city: 'Salvador',
                                  state: 'Bahia', cellphone: '9999999999', status: 0)
    customer3 = Customer.create!(name: "Ully", last_name: "Sedro", email: 'ully@email.com',
                                  birthday: '31/10/1999', street: 'rua das margaridas',district: 'Barra',
                                  number: '200', complement: 'apto 500', city: 'Salvador',
                                  state: 'Bahia', cellphone: '9999999999', status: 0)
    # Act
    visit customers_path
    fill_in "Busca",	with: "Bianca"
    click_on 'Buscar'

    # Assert
    expect(page).to have_content 'Bianca Sedro'
    expect(page).to have_content 'Email: bianca@email.com'
    expect(page).not_to have_content ' Adriano Silva'
    expect(page).not_to have_content ' Email: adriano@email.com'
    expect(page).not_to have_content ' Email: ully@email.com'
    expect(page).not_to have_content ' Ully Sedro'
  end


end
