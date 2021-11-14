require 'rails_helper'

RSpec.describe UserTeam, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:user_team_players).dependent(:destroy) }
    it { should have_many(:players).through(:user_team_players) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'factories' do
    describe 'create(:user_team)' do
      subject(:user_team) { create(:user_team) }

      it 'creates a valid object' do
        expect(user_team).to be_valid
      end
    end
  end
end
