require 'rails_helper'


describe "usuário vê os detalhes de um cliente ao clicar no seu nome" do

  it "com sucesso" do
    # Arrange
    customer1 = Customer.create!(name: "Adriano", last_name: "Silva", email: 'adriano@email.com',
                                  birthday: '08/02/1991', street: 'rua das mangueiras',district: 'Brotas',
                                  number: '40', complement: 'apto 203', city: 'Salvador', state: 'Bahia')
    customer2 = Customer.create!(name: "Bianca", last_name: "Sedro", email: 'bianca@email.com',
                                  birthday: '31/10/1999', street: 'rua das margaridas',district: 'Barra',
                                  number: '200', complement: 'apto 500', city: 'Salvador', state: 'Bahia')

    #Act
    visit customers_path
    click_on 'Adriano Silva'

    # Assert
    expect(page).to have_content 'Adriano Silva'
    expect(page).not_to have_content 'Bianca Sedro'
    expect(page).to have_content 'Email: adriano@email.com'
    expect(page).to have_content 'Endereço: rua das mangueiras, n 40, apto 203. Salvador, Bahia'
    expect(page).to have_content 'Aniversário: 08/02/1991'



  end


end
