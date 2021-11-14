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

    describe '#create_valid_user_team' do
      subject(:user_team) { create_valid_user_team(user) }

      let(:user) { create(:user) }

      it 'creates valid objects' do
        expect(user_team).to be_valid
        expect(User.all.size).to eq(1)
        expect(UserTeam.all.size).to eq(1)
        expect(UserTeamPlayer.all.size).to eq(6)
        expect(Player.all.size).to eq(6)
      end
    end
  end

  describe 'instance methods' do
    describe '#budget_remaining' do
      it "returns the team's remaining budget" do
        user_team = create(:user_team)
        driver1 = create(:driver, price: 10.5)
        driver2 = create(:driver, price: 8.4)
        driver3 = create(:driver, price: 6.5)
        driver4 = create(:driver, price: 5.6)
        driver5 = create(:driver, price: 4.2)
        constructor = create(:constructor, price: 10.8)
        create(:user_team_player, player: driver1, user_team: user_team)
        create(:user_team_player, player: driver2, user_team: user_team)
        create(:user_team_player, player: driver3, user_team: user_team)
        create(:user_team_player, player: driver4, user_team: user_team)
        create(:user_team_player, player: driver5, user_team: user_team)
        create(:user_team_player, player: constructor, user_team: user_team)

        expect(user_team.budget_remaining).to eq(54)
      end
    end
  end
end
