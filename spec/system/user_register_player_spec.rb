require 'rails_helper'

describe 'user register a player' do
  it 'should only see new player page authenticated users' do
    visit new_player_path

    expect(current_path).to eq root_path
  end
end