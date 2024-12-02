require 'rails_helper'

describe 'user see player details' do
  it 'should only see new player page authenticated users' do
    visit new_player_path

    expect(current_path).to eq new_user_session_path
  end

  it 'user can see details of player' do
    user = User.create!(email: 'example@example.com', password: '1212121232323')
    player = Player.create!(name: 'Willian', nacionality: 'Brasileiro', birth_date: '22/02/1992')

    login_as(user)

    visit player_path(player)

    expect(page).to have_content('Nome: Willian')
    expect(page).to have_content('Nacionalidade: Brasileiro')
    expect(page).to have_content('Data de nascimento: 22/02/1992')
  end
end