require 'rails_helper'

describe "Usuário chega na página home" do
  it "com sucesso" do

    # Arrange

    # Act
    visit root_path

    # Assert

    expect(page).to have_content 'Cheia de Charme'

  end

  it "usuário vê lista de clientes" do

    # Arrange
    customer1 = Customer.create!(name: "Adriano", last_name: "Silva", email: 'adriano@email.com',
                                  birthday: '08/02/1991', street: 'rua das mangueiras',district: 'Brotas',
                                  number: '40', complement: 'apto 203', city: 'Salvador', state: 'Bahia')
    customer2 = Customer.create!(name: "Bianca", last_name: "Sedro", email: 'bianca@email.com',
                                  birthday: '31/10/1999', street: 'rua das margaridas',district: 'Barra',
                                  number: '200', complement: 'apto 500', city: 'Salvador', state: 'Bahia')
    customer3 = Customer.create!(name: "João", last_name: "Santos", email: 'joao@email.com',
                                  birthday: '20/10/2023', street: 'rua das palmeiras', district: 'Limoeiro',
                                  number: '20', complement: 'apto 400', city: 'Salvador', state: 'Bahia')

    # Act
    visit root_path

    # Assert

    expect(page).to have_content 'Adriano Silva'
    expect(page).to have_content 'Bianca Sedro'
    expect(page).to have_content 'João Santos'
    expect(page).to have_content 'Aniversário: 08/02/1991'
    expect(page).to have_content 'Aniversário: 31/10/1999'
    expect(page).to have_content 'Aniversário: 20/10/2023'
    expect(page).to have_content 'Email: adriano@email.com'
    expect(page).to have_content 'Email: bianca@email.com'
    expect(page).to have_content 'Email: joao@email.com'

  end

  it "e não tem nenhum cliente cadastrado" do

    # Arrange

    # Act
    visit root_path

    # Assert
    expect(page).to have_content 'Não existem clientes cadastrados!'

  end



end
