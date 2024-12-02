require 'rails_helper'

describe 'user register a player' do
  it 'should only see new player page authenticated users' do
    visit new_player_path

    expect(current_path).to eq new_user_session_path
  end

  it 'should show a form to register a new player' do
    user = User.create!(email: 'example@example.com', password: '1212121232323')

    login_as(user)

    visit root_path

    within 'nav' do
      click_on 'Novo Ator'
    end

    expect(page).to have_content('Cadastrar novo Ator ou Atriz')

    expect(page).to have_field('Nome')
    expect(page).to have_field('Data de nascimento')
    expect(page).to have_field('Nacionalidade')

    expect(page).to have_button('Criar Ator')
  end

  it 'user can add a new actor with success' do
    user = User.create!(email: 'example@example.com', password: '1212121232323')

    login_as(user)

    visit root_path

    within 'nav' do
      click_on 'Novo Ator'
    end

    fill_in('Nome', with: 'Antonio Bandeiras')
    fill_in('Nacionalidade', with: 'Argentino')
    fill_in('Data de nascimento', with: '12/12/1950')

    click_on 'Criar Ator'

    expect(page).to have_content('Ator ou Atriz adicionado com sucesso.')
  end

  it 'user cannot add player with blank fields' do
    user = User.create!(email: 'example@example.com', password: '1212121232323')

    login_as(user)

    visit root_path

    within 'nav' do
      click_on 'Novo Ator'
    end

    fill_in('Nome', with: '')
    fill_in('Nacionalidade', with: '')
    fill_in('Data de nascimento', with: '')

    click_on 'Criar Ator'

    expect(page).to have_content('Erro ao adicionar Ator ou Atriz.')
  end
end