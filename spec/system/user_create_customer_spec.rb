require 'rails_helper'

describe "Usuário cria um novo cliente" do
  it "Chega na página de cadastro com sucesso" do
    #Arrange

    #Act
    visit customers_path
    click_on 'Cadastrar'

    #Assert
    expect(page).to have_field 'Nome'
    expect(page).to have_field 'E-mail'
    expect(page).to have_field 'Rua'
    expect(page).to have_field 'Aniversário'
    expect(page).to have_field 'Cidade'
    expect(page).to have_field 'Estado'
  end


end
