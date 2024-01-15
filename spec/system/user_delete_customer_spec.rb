require 'rails_helper'

describe "User delete customer" do
  it "with sucess" do
    # Arrange
    customer = Customer.create!(name: "Adriano", last_name: "Silva", email: 'adriano@email.com',
                                  birthday: '08/02/1991', street: 'rua das mangueiras',district: 'Brotas',
                                  number: '40', complement: 'apto 203', city: 'Salvador',
                                  state: 'Bahia', cellphone: '9999999999', status: 0)
    customer2 = Customer.create!(name: "Bianca", last_name: "Sedro", email: 'bianca@email.com',
                                  birthday: '31/10/1999', street: 'rua das margaridas',district: 'Barra',
                                  number: '200', complement: 'apto 500', city: 'Salvador',
                                  state: 'Bahia', cellphone: '9999999999', status: 0)
    # Act
    visit customer_path(customer.id)
    click_on 'Delete'

    # Assert
    expect(page).to have_content 'Bianca Sedro'
    expect(page).to have_content 'Email: bianca@email.com'
    expect(page).to have_content "Cliente #{customer.full_name} deletado."
    expect(page).not_to have_content 'E-mail: adriano@email.com'
  end

end
