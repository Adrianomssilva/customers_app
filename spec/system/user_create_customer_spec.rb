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

  it "Cria um usuário com sucesso" do
    #Arrange

    #Act
    visit customers_path
    click_on 'Cadastrar'
    fill_in "Nome",	with: "Adriano"
    fill_in "Último Nome",	with: "Silva"
    fill_in "E-mail",	with: "adriano@email.com"
    fill_in "Celular",	with: "71999999999"
    fill_in "Aniversário",	with: "08/02/1991"
    fill_in "Rua",	with: "Rua dos anjos"
    fill_in "Número",	with: "40"
    fill_in "Complemento",	with: "apto 1001, edf Vale da lua"
    fill_in "Bairro",	with: "Vilas"
    fill_in "Cidade",	with: "Central"
    fill_in "Estado",	with: "Bahia"
    click_on 'Criar Cliente'

    #Assert
    expect(page).to have_content 'Adriano Silva'
    expect(page).to have_content 'Aniversário: 08/02/1991'
    expect(page).to have_content 'Email: adriano@email.com'
    expect(page).to have_content 'Cliente salvo com sucesso'

  end
  it "Cria um usuário sem sucesso" do
    #Arrange

    #Act
    visit customers_path
    click_on 'Cadastrar'
    fill_in "Nome",	with: ""
    fill_in "Último Nome",	with: "Silva"
    fill_in "E-mail",	with: "adriano@email.com"
    fill_in "Celular",	with: "71999999999"
    fill_in "Aniversário",	with: "08/02/1991"
    fill_in "Rua",	with: "Rua dos anjos"
    fill_in "Número",	with: "40"
    fill_in "Complemento",	with: "apto 1001, edf Vale da lua"
    fill_in "Bairro",	with: "Vilas"
    fill_in "Cidade",	with: "Central"
    fill_in "Estado",	with: "Bahia"
    click_on 'Criar Cliente'

    #Assert
    expect(page).not_to have_content 'Adriano Silva'
    expect(page).not_to have_content 'Cliente salvo com sucesso'
    expect(page).to have_content 'Nome não pode ficar em branco'
  end


end
