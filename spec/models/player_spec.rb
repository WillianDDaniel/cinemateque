require 'rails_helper'

RSpec.describe Player, type: :model do
  describe '#valid?' do
    it 'should not be valid with no name' do
      player = Player.new(nacionality: 'brasileiro', birth_date: '22/02/1992')

      player.valid?
      expect(player.errors.include?(:name)).to be true
    end

    it 'should not be valid with no nacionality' do
      player = Player.new(name: 'Willian', birth_date: '22/02/1992')

      player.valid?
      expect(player.errors.include?(:nacionality)).to be true
    end

    it 'should not be valid with no birth_date' do
      player = Player.new(nacionality: 'brasileiro', name: 'Willian')

      player.valid?
      expect(player.errors.include?(:birth_date)).to be true
    end
  end
end
