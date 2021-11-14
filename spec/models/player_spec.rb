require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'relationships' do
    it { should belong_to(:team) }
    it { should have_many(:user_team_players).dependent(:destroy) }
    it { should have_many(:user_teams).through(:user_team_players) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price).is_greater_than(0).is_less_than(100) }
  end

  describe 'factories' do
    describe 'create(:player)' do
      subject(:player) { create(:player) }

      it 'creates a valid object' do
        expect(player).to be_valid
      end
    end
  end
end
