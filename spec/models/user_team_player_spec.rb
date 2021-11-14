require 'rails_helper'

RSpec.describe UserTeamPlayer, type: :model do
  describe 'relationships' do
    it { should belong_to(:user_team) }
    it { should belong_to(:player) }
  end

  describe 'factories' do
    describe 'create(:user_team_player)' do
      subject(:user_team_player) { create(:user_team_player) }

      it 'creates a valid object' do
        expect(user_team_player).to be_valid
      end
    end
  end
end
